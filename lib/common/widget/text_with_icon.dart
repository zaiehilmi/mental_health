import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:schedule_management/common/utils/extensions/buildcontext_extension.dart';

class TextWithIcon extends HookWidget {
  final String text;
  final Widget? leading;
  final Widget? trailing;
  final Color? foregroundColor;

  const TextWithIcon({
    required this.text,
    super.key,
    this.leading,
    this.trailing,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Row(
        spacing: 8,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        textBaseline: TextBaseline.alphabetic,
        children: [
          if (leading != null)
            IconTheme(
              data: IconThemeData(
                color:
                    foregroundColor?.withValues(alpha: .40) ??
                    context.colorScheme.secondary.withValues(alpha: .40),
                size: 17,
              ),
              child: leading!,
            ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: context.textTheme.labelMedium?.copyWith(
              color: foregroundColor ?? context.colorScheme.secondary,
            ),
          ),
          if (trailing != null)
            IconTheme(
              data: IconThemeData(
                color:
                    foregroundColor?.withValues(alpha: .40) ??
                    context.colorScheme.secondary.withValues(alpha: .40),
                size: 17,
              ),
              child: trailing!,
            ),
        ],
      ),
    );
  }
}
