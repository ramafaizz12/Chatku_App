import 'package:chat_app_firebase/shared/theme.dart';
import 'package:flutter/material.dart';

class MessageInput extends StatelessWidget {
  final double width;
  final double height;
  final TextEditingController message;
  const MessageInput(
      {super.key,
      required this.message,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: abuabu, borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: EdgeInsets.only(left: width * 0.04, right: width * 0.02),
        child: Row(
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.mic)),
            Expanded(
                child: TextField(
              controller: message,
              style: textpoppins,
              decoration: InputDecoration(
                  hintText: "Type Here..", hintStyle: textpoppins),
            )),
            IconButton(onPressed: () {}, icon: Icon(Icons.picture_in_picture)),
            IconButton(onPressed: () {}, icon: Icon(Icons.send))
          ],
        ),
      ),
    );
  }
}
