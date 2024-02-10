import 'package:chat_app_firebase/shared/theme.dart';
import 'package:flutter/material.dart';

class ContainerSlide extends StatefulWidget {
  final double width;
  final double height;
  const ContainerSlide({super.key, required this.width, required this.height});

  @override
  State<ContainerSlide> createState() => _ContainerSlideState();
}

class _ContainerSlideState extends State<ContainerSlide> {
  bool warna = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              warna = true;
            });
          },
          child: Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
                color: warna ? colorbiru : abuabu,
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: EdgeInsets.only(
                  right: widget.width * 0.1, top: widget.width * 0.05),
              child: Text(
                "Group",
                textAlign: TextAlign.end,
                style: textpoppins.copyWith(color: pinkabu),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              warna = false;
            });
          },
          child: Container(
            width: widget.width * 0.5,
            height: widget.height,
            decoration: BoxDecoration(
                color: warna ? abuabu : colorbiru,
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: EdgeInsets.only(
                  left: widget.width * 0.07, top: widget.width * 0.05),
              child: Text(
                "Message",
                style: textpoppins.copyWith(color: pinkabu),
                textAlign: TextAlign.start,
              ),
            ),
          ),
        )
      ],
    );
  }
}
