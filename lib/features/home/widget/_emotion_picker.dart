import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:schedule_management/common/utils/extensions/buildcontext_extension.dart';

class EmotionPicker extends HookWidget {
  final double leadingSpace;
  final List<Emotion> emotions;

  const EmotionPicker({super.key, required this.emotions, this.leadingSpace = 4});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 25,
        children: [
          SizedBox(width: leadingSpace),
          ...emotions.map((emotion) => EmotionItem(emotion: emotion)),
        ],
      ),
    );
  }
}

class Emotion {
  final String name;
  final String icon;
  final Color color;

  const Emotion({required this.name, required this.icon, required this.color});
}

class EmotionItem extends HookWidget {
  final Emotion emotion;

  const EmotionItem({super.key, required this.emotion});

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Column(
        spacing: 8,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 62,
            width: 60,
            decoration: BoxDecoration(
              color: emotion.color,
              borderRadius: BorderRadius.circular(16),
            ),
            child: SvgPicture.asset(emotion.icon, width: 32, height: 32, fit: BoxFit.scaleDown),
          ),

          Text(context.tr(emotion.name), style: context.textTheme.labelMedium),
        ],
      ),
    );
  }
}
