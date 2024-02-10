import 'package:chat_app_firebase/shared/theme.dart';
import 'package:flutter/material.dart';

class ContainerPlus extends StatelessWidget {
  final double width;
  final double height;
  const ContainerPlus({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            border: Border.all(color: abuabu, width: 7),
            shape: BoxShape.circle,
            color: colorbiru,
          ),
          child: LayoutBuilder(
            builder: (p0, p1) => Center(
                child: Icon(
              Icons.add,
              color: pinkabu,
              size: p1.maxWidth * 0.3,
            )),
          )),
    );
  }
}
