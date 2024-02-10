import 'package:chat_app_firebase/features/auth/bloc/auth_bloc.dart';
import 'package:chat_app_firebase/features/auth/data/auth_repository.dart';
import 'package:chat_app_firebase/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthRepository servis = AuthRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: putihh,
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: const Text("Logout"),
                onTap: () {
                  context.read<AuthBloc>().add(LogoutEvent());
                },
              )
            ],
          )
        ],
        title: Text("HomePage"),
      ),
      // body: Stack(children: [buildgroupchat()]),
    );
  }

  // Widget userlist() {
  //   return StreamBuilder(
  //       stream: FirebaseFirestore.instance.collection('users').snapshots(),
  //       builder: (context, snapshot) {
  //         if (snapshot.hasError) {
  //           return const Text("Error");
  //         }
  //         if (snapshot.connectionState == ConnectionState.waiting) {
  //           return const CircularProgressIndicator();
  //         }
  //         return ListView(
  //             children: snapshot.data!.docs
  //                 .map((e) => builduserlistview(e))
  //                 .toList());
  //       });
  // }

  // Widget builduserlistview(DocumentSnapshot document) {
  //   Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

  //   if (AuthRepository.firebaseuserauth!.email != data['email']) {
  //     return ListTile(
  //       title: Text(data['email']),
  //       onLongPress: () {
  //         setState(() {
  //           grupchat = true;
  //         });
  //       },
  //       onTap: () {
  //         Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //               builder: (context) =>
  //                   Chatpage(useremail: data['email'], userid: data['uid']),
  //             ));
  //         ;
  //       },
  //     );
  //   }

  //   return Container();
  // }

  // Widget buildgroupchat() {
  //   return grupchat != false
  //       ? Padding(
  //           padding: const EdgeInsets.only(right: 12, bottom: 12),
  //           child: Align(
  //               alignment: Alignment.bottomRight,
  //               child: FloatingActionButton(onPressed: () {})),
  //         )
  //       : const SizedBox();
  // }
}
