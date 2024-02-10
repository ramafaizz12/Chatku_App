import 'package:chat_app_firebase/shared/theme.dart';
import 'package:flutter/material.dart';

class ContainerCircle extends StatelessWidget {
  final double width;
  final double height;
  final IconData icon;
  const ContainerCircle(
      {super.key,
      required this.width,
      required this.height,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
          width: width,
          height: height,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: abuabu,
          ),
          child: LayoutBuilder(
            builder: (p0, p1) => Center(
                child: Icon(
              icon,
              color: pinkabu,
              size: p1.maxWidth * 0.3,
            )),
          )),
    );
  }
}
