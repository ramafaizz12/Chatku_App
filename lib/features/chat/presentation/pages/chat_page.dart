import 'package:chat_app_firebase/features/chat/presentation/pages/chat_room_page.dart';
import 'package:chat_app_firebase/features/chat/presentation/widgets/container_circle.dart';
import 'package:chat_app_firebase/features/chat/presentation/widgets/container_list_people.dart';
import 'package:chat_app_firebase/features/chat/presentation/widgets/container_slide.dart';
import 'package:chat_app_firebase/shared/theme.dart';
import 'package:flutter/material.dart';

class Chatpage extends StatefulWidget {
  const Chatpage({super.key});

  @override
  State<Chatpage> createState() => _ChatpageState();
}

class _ChatpageState extends State<Chatpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pinkabu,
      body: LayoutBuilder(
        builder: (context, p1) => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ContainerCircle(
                    width: p1.maxWidth * 0.12,
                    height: p1.maxHeight * 0.12,
                    icon: Icons.person),
                ContainerSlide(
                    width: p1.maxWidth * 0.6, height: p1.maxHeight * 0.07),
                ContainerCircle(
                    width: p1.maxWidth * 0.12,
                    height: p1.maxHeight * 0.12,
                    icon: Icons.notifications_on),
              ],
            ),
            SizedBox(
              width: p1.maxWidth,
              height: p1.maxHeight * 0.7,
              child: GridView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 15.0,
                      crossAxisSpacing: 10.0,
                      crossAxisCount: 1,
                      childAspectRatio: (24 / 5)),
                  itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChatRoom(),
                              ));
                        },
                        child: ContainerPeople(
                            height: p1.maxHeight * 0.12, width: p1.maxHeight),
                      )),
            ),
          ],
        ),
      ),
    );
  }
}
