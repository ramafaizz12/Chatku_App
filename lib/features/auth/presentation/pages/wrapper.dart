import 'package:chat_app_firebase/features/auth/presentation/pages/login_page.dart';
import 'package:chat_app_firebase/features/home/presentation/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    User? firebaseuser = Provider.of<User?>(context);
    return (firebaseuser == null) ? const LoginPage() : HomePage();
  }
}
