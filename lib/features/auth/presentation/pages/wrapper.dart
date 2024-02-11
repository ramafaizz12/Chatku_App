import 'package:chat_app_firebase/features/auth/data/auth_repository.dart';
import 'package:chat_app_firebase/features/auth/presentation/pages/login_page.dart';
import 'package:chat_app_firebase/features/home/presentation/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: AuthRepository.firebaseuserstream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const HomePage();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
