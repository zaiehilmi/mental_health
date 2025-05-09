import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:schedule_management/common/utils/extensions/buildcontext_extension.dart';

class QuoteCard extends HookWidget {
  final Color backgroundColor;
  final String quote;

  const QuoteCard({super.key, required this.quote, this.backgroundColor = const Color(0xffF4F3F1)});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        decoration: BoxDecoration(color: backgroundColor, borderRadius: BorderRadius.circular(16)),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(
                quote,
                style: context.textTheme.bodySmall?.copyWith(color: Color(0xff707070)),
              ),
            ),
            Expanded(child: Icon(Icons.format_quote, color: Color(0xffD9D8D8), size: 40)),
          ],
        ),
      ),
    );
  }
}
