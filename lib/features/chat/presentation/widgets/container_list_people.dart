import 'package:chat_app_firebase/shared/theme.dart';
import 'package:flutter/material.dart';

class ContainerPeople extends StatelessWidget {
  final double width;
  final double height;
  const ContainerPeople({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration:
          BoxDecoration(color: abuabu, borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: EdgeInsets.all(width * 0.02),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.person,
              color: pinkabu,
            ),
            Column(
              children: [
                Text(
                  "Nala Sofyan",
                  style: textpoppins.copyWith(
                      color: black,
                      fontWeight: FontWeight.bold,
                      fontSize: width * 0.02),
                ),
                Text(
                  "Dimanaa",
                  style: textpoppins.copyWith(
                      color: black, fontSize: width * 0.017),
                )
              ],
            ),
            Column(
              children: [
                Text(
                  "14.23",
                  style: textpoppins.copyWith(
                      color: black, fontSize: width * 0.017),
                ),
                Text(
                  "3",
                  style: textpoppins.copyWith(
                      color: black, fontSize: width * 0.017),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
