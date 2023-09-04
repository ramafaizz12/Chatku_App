import 'package:chat_app_firebase/Chat_Page.dart';
import 'package:chat_app_firebase/services/firebase_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseService servis = FirebaseService();

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
      body: userlist(),
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
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    Chat_Page(useremail: data['email'], userid: data['uid']),
              ));
          ;
        },
      );
    }
    return Container();
  }
}
