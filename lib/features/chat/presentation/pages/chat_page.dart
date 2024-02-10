import 'package:chat_app_firebase/features/auth/data/auth_repository.dart';
import 'package:chat_app_firebase/features/chat/data/chat_repository.dart';
import 'package:chat_app_firebase/features/chat/presentation/widgets/chat_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Chatpage extends StatefulWidget {
  final String useremail;
  final String userid;
  const Chatpage({super.key, required this.useremail, required this.userid});

  @override
  State<Chatpage> createState() => _ChatpageState();
}

class _ChatpageState extends State<Chatpage> {
  final TextEditingController _message = TextEditingController();
  final ChatService servis = ChatService();
  final ScrollController _scrollController = ScrollController();

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
      body: LayoutBuilder(
        builder: (context, p1) => Column(
          children: [
            // SizedBox(
            //     width: p1.maxWidth,
            //     height: p1.maxHeight * 0.5,
            //     child: buildmessagelist()),
            SizedBox(
              height: 12,
            ),
            SizedBox(
                width: p1.maxWidth,
                height: p1.maxHeight * 0.3,
                child: buildmessageinput()),
          ],
        ),
      ),
    );
  }

  // Widget buildmessagelist() {
  //   return StreamBuilder(
  //     stream: servis.getMessage(
  //         widget.userid, AuthRepository.firebaseuserauth!.uid),
  //     builder: (context, snapshot) {
  //       if (snapshot.hasError) {
  //         return const Text("Error");
  //       }
  //       if (snapshot.connectionState == ConnectionState.waiting) {
  //         return const CircularProgressIndicator();
  //       }
  //       return ListView(
  //           controller: _scrollController,
  //           reverse: false,
  //           children:
  //               snapshot.data!.docs.map((e) => buildmessageitem(e)).toList());
  //     },
  //   );
  // }

  // Widget buildmessageitem(DocumentSnapshot document) {
  //   Map<String, dynamic> data = document.data() as Map<String, dynamic>;

  //   var alignment = (data['senderid'] == AuthRepository.firebaseuserauth!.uid)
  //       ? Alignment.centerRight
  //       : Alignment.centerLeft;
  //   return Container(
  //     alignment: alignment,
  //     child: Column(
  //       children: [
  //         Text(data['senderemail']),
  //         ChatBubble(message: data['message'])
  //       ],
  //     ),
  //   );
  // }

  Widget buildmessageinput() {
    return Row(
      children: [
        Expanded(
            child: TextField(
          controller: _message,
          decoration: const InputDecoration(hintText: "Enter Message"),
        )),
        IconButton(
            onPressed: () {
              servis.sendMessage(widget.userid, _message.text);
              _scrollController.animateTo(
                _scrollController.position.maxScrollExtent,
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
            icon: const Icon(Icons.send))
      ],
    );
  }
}
