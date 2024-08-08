import 'package:chat_app_firebase/features/chat/presentation/widgets/container_circle.dart';
import 'package:chat_app_firebase/features/chat/presentation/widgets/message_input_container.dart';
import 'package:chat_app_firebase/shared/theme.dart';
import 'package:flutter/material.dart';

class ChatRoom extends StatelessWidget {
  const ChatRoom({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController message = TextEditingController();
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, p1) => Padding(
            padding: EdgeInsets.only(
                top: p1.maxWidth * 0.05,
                left: p1.maxWidth * 0.03,
                right: p1.maxWidth * 0.03),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(
                      width: p1.maxWidth * 0.04,
                    ),
                    Expanded(
                      child: ContainerCircle(
                          width: p1.maxWidth * 0.13,
                          height: p1.maxHeight * 0.06,
                          icon: Icons.person),
                    ),
                    SizedBox(
                      width: p1.maxWidth * 0.02,
                    ),
                    Column(
                      children: [
                        Text(
                          "Nama",
                          style: textpoppins,
                        ),
                        Text(
                          "Status",
                          style: textpoppins,
                        )
                      ],
                    ),
                    SizedBox(
                      width: p1.maxWidth * 0.3,
                    ),
                    Icon(Icons.video_call),
                    SizedBox(
                      width: p1.maxWidth * 0.04,
                    ),
                    Icon(Icons.phone)
                  ],
                ),
                Expanded(
                  child: SizedBox(
                    width: p1.maxWidth,
                    height: p1.maxHeight * 0.83,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: p1.maxHeight * 0.01),
                  child: MessageInput(
                    message: message,
                    width: p1.maxWidth * 0.9,
                    height: p1.maxHeight * 0.05,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
