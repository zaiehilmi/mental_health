import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends HookWidget {
  final String text;
  final Icon? icon;
  final Color backgroundColor;
  final VoidCallback? onTap;

  const Button(
    this.text, {
    super.key,
    this.icon,
    this.backgroundColor = const Color(0xffF4F3F1),
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(color: backgroundColor, borderRadius: BorderRadius.circular(16)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            if (icon != null)
              Expanded(
                flex: 1,
                child: IconTheme(data: IconThemeData(color: Color(0xffD6CCC6)), child: icon!),
              ),
            Expanded(
              flex: 4,
              child: Text(
                text,
                style: GoogleFonts.epilogue(
                  color: Color(0xff573926),
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
