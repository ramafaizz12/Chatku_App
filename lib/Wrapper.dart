import 'package:chat_app_firebase/HomePage.dart';
import 'package:chat_app_firebase/Login_Page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User? firebaseuser = Provider.of<User?>(context);
    return (firebaseuser == null) ? LoginPage() : HomePage();
  }
}
