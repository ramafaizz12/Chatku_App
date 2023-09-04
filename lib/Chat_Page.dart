import 'package:chat_app_firebase/services/chat/chat_service.dart';
import 'package:chat_app_firebase/services/firebase_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Chat_Page extends StatefulWidget {
  final String useremail;
  final String userid;
  const Chat_Page({super.key, required this.useremail, required this.userid});

  @override
  State<Chat_Page> createState() => _Chat_PageState();
}

class _Chat_PageState extends State<Chat_Page> {
  final TextEditingController _message = TextEditingController();
  final ChatService servis = ChatService();

  void sendmessage() async {
    if (_message.text.isNotEmpty) {
      await servis.sendMessage(widget.userid, _message.text);
      _message.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.useremail),
      ),
      body: Column(
        children: [
          Expanded(child: buildmessagelist()),
          buildmessageinput(),
        ],
      ),
    );
  }

  Widget buildmessagelist() {
    return StreamBuilder(
      stream: servis.getMessage(
          widget.userid, FirebaseService.firebaseuserauth!.uid),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Error");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        return ListView(
            children:
                snapshot.data!.docs.map((e) => buildmessageitem(e)).toList());
      },
    );
  }

  Widget buildmessageitem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    var alignment = (data['senderid'] == FirebaseService.firebaseuserauth!.uid)
        ? Alignment.centerRight
        : Alignment.centerLeft;
    return Container(
      alignment: alignment,
      child: Column(
        children: [Text(data['senderemail']), Text(data['message'])],
      ),
    );
  }

  Widget buildmessageinput() {
    return Row(
      children: [
        Expanded(
            child: TextField(
          controller: _message,
          decoration: InputDecoration(hintText: "Enter Message"),
        )),
        IconButton(
            onPressed: () {
              servis.sendMessage(widget.userid, _message.text);
            },
            icon: Icon(Icons.send))
      ],
    );
  }
}
