import 'package:chat_app_firebase/features/auth/data/auth_repository.dart';
import 'package:flutter/material.dart';

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
      builder: (p0, p1) => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Stack(children: [
          Padding(
            padding: EdgeInsets.only(
                top: p1.maxHeight * 0.15,
                left: p1.maxWidth * 0.032,
                right: p1.maxWidth * 0.032),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: FloatingActionButton(
                    backgroundColor: Colors.orange,
                    elevation: 12,
                    onPressed: () {},
                    child: Icon(Icons.arrow_back),
                  ),
                ),
                SizedBox(
                  height: p1.maxHeight * 0.01,
                ),
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
                            SizedBox(height: p1.maxHeight * 0.031),
                            Text(
                              "Login",
                            ),
                            SizedBox(
                              height: p1.maxHeight * 0.05,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Email",
                                ),
                                Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: TextField(
                                      keyboardType: TextInputType.emailAddress,
                                      onChanged: (text) {},
                                      decoration: const InputDecoration(
                                          contentPadding:
                                              EdgeInsets.only(top: 5, left: 8),
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
                                const Text(
                                  "Password",
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Stack(children: [
                                    TextField(
                                      obscureText: obscure,
                                      decoration: const InputDecoration(
                                          contentPadding:
                                              EdgeInsets.only(top: 5, left: 8),
                                          border: InputBorder.none),
                                      controller: password,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: p1.maxHeight * 0.02,
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
                                InkWell(
                                  onTap: () {
                                    auth.signinEmail(
                                        username.text, password.text);
                                  },
                                  child: Container(
                                    width: 120,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.blueAccent,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: const Text("LOGIN"),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: p1.maxHeight * 0.03,
                            ),
                          ]),
                    ),
                  ],
                ),
                SizedBox(
                  height: p1.maxHeight * 0.07,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
