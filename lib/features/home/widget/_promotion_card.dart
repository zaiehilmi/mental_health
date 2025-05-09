import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/utils/extensions/buildcontext_extension.dart';
import '../../../common/widget/enhanced_card.dart';
import '../../../common/widget/text_with_icon.dart';

class PromotionCard extends HookWidget {
  final Color seedColor;

  /// When set this to true, all of the text will be white. Please use darker color when set the seedColor
  final bool useOriginalColorOnBackground;
  final String? title;
  final String? description;
  final String? buttonText;
  final Widget buttonIcon;
  final VoidCallback? onTapButton;
  final Widget? image;

  const PromotionCard({
    super.key,
    this.seedColor = const Color(0xffFEF3E7),
    this.useOriginalColorOnBackground = false,
    this.title,
    this.description,
    this.buttonText,
    required this.buttonIcon,
    this.onTapButton,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return EnhancedCard(
      seedColor: seedColor,
      useOriginalColorOnBackground: useOriginalColorOnBackground,
      title: Text(
        title!,
        style: GoogleFonts.epilogue(
          fontWeight: FontWeight.w700,
          fontSize: 22,
          color: (useOriginalColorOnBackground) ? Colors.white : context.colorScheme.primary,
        ),
      ),
      description: Text(
        description!,
        style: GoogleFonts.rubik(
          fontSize: 12,
          color: (useOriginalColorOnBackground) ? Colors.white : context.colorScheme.secondary,
        ),
      ),
      action: TextButton(
        onPressed: onTapButton,
        child: TextWithIcon(
          text: buttonText ?? '',
          trailing: buttonIcon,
          foregroundColor:
              (useOriginalColorOnBackground)
                  ? Colors.white
                  : Theme.of(context).colorScheme.tertiary,
        ),
      ),
      image: image,
    );
  }
}
