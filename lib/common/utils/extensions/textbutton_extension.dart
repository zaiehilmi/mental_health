import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

extension TextButtonExtension on TextButton {
  static Widget withTrailingIcon(
    BuildContext context, {
    required VoidCallback? onPressed,
    required Widget icon,
    Widget? label,
    String labelString = '',
    Color? foregroundColor,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool autofocus = false,
    Clip clipBehavior = Clip.none,
  }) {
    return TextButton(
      onPressed: onPressed,
      style: style,
      focusNode: focusNode,
      autofocus: autofocus,
      clipBehavior: clipBehavior,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10,
        children: [
          if (label != null)
            label
          else
            Text(
              labelString,
              style: GoogleFonts.epilogue(
                color: foregroundColor ?? Theme.of(context).colorScheme.tertiary,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          IconTheme(
            data: IconThemeData(
              color: foregroundColor ?? Theme.of(context).colorScheme.tertiary,
              size: 20,
            ),
            child: icon,
          ),
        ],
      ),
    );
  }
}
