import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schedule_management/common/utils/extensions/buildcontext_extension.dart';

// TODO: tambah estetik kat hujung bawah kanan
class EnhancedCard extends HookWidget {
  final Color seedColor;

  /// When set this to true, all of the text will be white. Please use darker color when set the seedColor
  final bool useOriginalColorOnBackground;
  final Widget? title;
  final Widget? description;
  final Widget? action;
  final Widget? image;

  const EnhancedCard({
    super.key,
    this.seedColor = const Color(0xffFEF3E7),
    this.useOriginalColorOnBackground = false,
    this.title,
    this.description,
    this.action,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: context.theme.copyWith(colorScheme: ColorScheme.fromSeed(seedColor: seedColor)),
      child: Builder(
        builder: (localContext) {
          final customTheme = Theme.of(localContext);

          return ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 50),
            child: Card.filled(
              color:
                  (useOriginalColorOnBackground)
                      ? seedColor
                      : customTheme.colorScheme.surfaceContainer,
              margin: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (title != null)
                            DefaultTextStyle(
                              style: GoogleFonts.epilogue(
                                fontWeight: FontWeight.w700,
                                fontSize: 22,
                                color:
                                    (useOriginalColorOnBackground)
                                        ? Colors.white
                                        : context.colorScheme.secondary,
                              ),
                              child: title!,
                            ),
                          if (description != null)
                            Padding(padding: const EdgeInsets.only(top: 10), child: description!),
                          if (action != null)
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: IntrinsicWidth(child: action),
                            ),
                        ],
                      ),
                    ),
                    if (image != null)
                      Expanded(
                        flex: 2,
                        child: Padding(padding: const EdgeInsets.all(10), child: image!),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
