import 'package:chat_app_firebase/features/auth/bloc/auth_bloc.dart';
import 'package:chat_app_firebase/features/auth/data/auth_repository.dart';
import 'package:chat_app_firebase/features/auth/presentation/widgets/button.dart';
import 'package:chat_app_firebase/features/auth/presentation/widgets/status_auth.dart';
import 'package:chat_app_firebase/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AuthRepository auth = AuthRepository();
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool isemailvalid = false;
  bool obscure = true;
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) => SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: pinkabu,
          body: Stack(children: [
            Padding(
              padding: EdgeInsets.only(
                  top: p1.maxHeight * 0.15,
                  left: p1.maxWidth * 0.032,
                  right: p1.maxWidth * 0.032),
              child: Column(
                children: [
                  onstatus(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: p1.maxHeight * 0.02,
                            right: p1.maxHeight * 0.02),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Icon(
                                  Icons.chat,
                                  size: p1.maxWidth * 0.3,
                                ),
                              ),
                              SizedBox(
                                height: p1.maxHeight * 0.05,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Email",
                                    style: textpoppins.copyWith(
                                        fontSize: p1.maxWidth * 0.04),
                                  ),
                                  Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: TextField(
                                        style: textpoppins,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        onChanged: (text) {},
                                        decoration: const InputDecoration(
                                            contentPadding: EdgeInsets.only(
                                                top: 5, left: 8),
                                            border: InputBorder.none),
                                        controller: username,
                                      ))
                                ],
                              ),
                              SizedBox(
                                height: p1.maxHeight * 0.02,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Password",
                                    style: textpoppins.copyWith(
                                        fontSize: p1.maxWidth * 0.04),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Stack(children: [
                                      TextField(
                                        obscureText: obscure,
                                        decoration: const InputDecoration(
                                            contentPadding: EdgeInsets.only(
                                                top: 5, left: 8),
                                            border: InputBorder.none),
                                        controller: password,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: p1.maxHeight * 0.015,
                                            right: p1.maxWidth * 0.02),
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: obscure != true
                                                ? InkWell(
                                                    child: const Icon(
                                                        Icons.visibility),
                                                    onTap: () {
                                                      setState(() {
                                                        obscure = true;
                                                      });
                                                    })
                                                : InkWell(
                                                    child: const Icon(
                                                        Icons.visibility_off),
                                                    onTap: () {
                                                      setState(() {
                                                        obscure = false;
                                                      });
                                                    })),
                                      ),
                                    ]),
                                  ),
                                  SizedBox(
                                    height: p1.maxHeight * 0.02,
                                  ),
                                  BlocBuilder<AuthBloc, AuthState>(
                                    builder: (context, state) {
                                      return state is AuthLoading
                                          ? const Center(
                                              child: CircularProgressIndicator(
                                              backgroundColor: hitamungu,
                                            ))
                                          : AuthButton(
                                              width: p1.maxWidth,
                                              height: p1.maxHeight * 0.06,
                                              namabutton: "Log In",
                                              onTap: () {
                                                context.read<AuthBloc>().add(
                                                    LoginEvent(
                                                        email: username.text,
                                                        password:
                                                            password.text));
                                              },
                                            );
                                    },
                                  ),
                                  SizedBox(
                                    height: p1.maxHeight * 0.02,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Belum Punya Akun ?",
                                        style: textpoppins.copyWith(
                                            fontSize: p1.maxWidth * 0.03),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Text(
                                          "Sign Up Disini",
                                          style: textpoppins.copyWith(
                                              fontSize: p1.maxWidth * 0.03,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
