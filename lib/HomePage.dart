import 'package:chat_app_firebase/Chat_Page.dart';
import 'package:chat_app_firebase/services/firebase_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseService servis = FirebaseService();
  bool grupchat = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: const Text("Logout"),
                onTap: () {
                  servis.logoutanonymus();
                },
              )
            ],
          )
        ],
        title: Text(FirebaseService.firebaseuserauth!.email!.toString()),
      ),
      body: Stack(children: [userlist(), buildgroupchat()]),
    );
  }

  Widget userlist() {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("Error");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          return ListView(
              children: snapshot.data!.docs
                  .map((e) => builduserlistview(e))
                  .toList());
        });
  }

  Widget builduserlistview(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

    if (FirebaseService.firebaseuserauth!.email != data['email']) {
      return ListTile(
        title: Text(data['email']),
        onLongPress: () {
          setState(() {
            grupchat = true;
          });
        },
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    Chatpage(useremail: data['email'], userid: data['uid']),
              ));
          ;
        },
      );
    }

    return Container();
  }

  Widget buildgroupchat() {
    return grupchat != false
        ? Padding(
            padding: const EdgeInsets.only(right: 12, bottom: 12),
            child: Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(onPressed: () {})),
          )
        : const SizedBox();
  }
}
