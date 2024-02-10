import 'package:chat_app_firebase/shared/theme.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String? namabutton;
  final void Function()? onTap;
  final double? width;
  final double? height;
  const AuthButton(
      {super.key,
      this.width,
      this.height,
      required this.namabutton,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: colorbiru, borderRadius: BorderRadius.circular(15)),
        child: LayoutBuilder(
            builder: (context, p1) => Center(
                    child: Text(
                  namabutton!,
                  style: textpoppins.copyWith(
                      fontSize: p1.maxWidth * 0.04, color: pinkabu),
                ))),
      ),
    );
  }
}
