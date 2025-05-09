import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schedule_management/common/utils/extensions/buildcontext_extension.dart';
import 'package:schedule_management/common/theme/theme_data.dart';
import 'package:schedule_management/common/utils/extensions/datetime_extension.dart';
import 'package:schedule_management/common/widget/avatar_icon.dart';
import 'package:schedule_management/common/widget/enhanced_card.dart';
import 'package:schedule_management/common/widget/text_with_icon.dart';

class ScheduledSessionCard extends HookWidget {
  final String? avatarImage;
  final String physiatristName;
  final String? physiatristDomain;
  final DateTime date;
  final DateTime startTime;
  final DateTime? endTime;
  final String primaryButtonTitle;
  final VoidCallback? onPrimaryButtonPressed;
  final String? secondaryButtonTitle;
  final VoidCallback? onSecondaryButtonPressed;

  const ScheduledSessionCard({
    super.key,
    this.avatarImage,
    required this.physiatristName,
    this.physiatristDomain,
    required this.date,
    required this.startTime,
    this.endTime,
    required this.primaryButtonTitle,
    this.onPrimaryButtonPressed,
    this.secondaryButtonTitle,
    this.onSecondaryButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return EnhancedCard(
      seedColor: Color(0xffF4F4F4),
      useOriginalColorOnBackground: true,
      title: _title(context),
      description: _descriptionBody(context),
      action: _actionButton(context),
    );
  }

  Widget _title(BuildContext context) {
    return Row(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AvatarIcon(imageUri: avatarImage, margin: EdgeInsets.zero),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 4,
          children: [
            // nama
            Text(
              physiatristName,
              style: GoogleFonts.rubik(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: context.colorScheme.primary,
              ),
            ),
            // domain
            Text(physiatristDomain ?? '', style: context.textTheme.labelSmall),
          ],
        ),
      ],
    );
  }

  Widget _descriptionBody(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 12),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: context.theme.dividerColor, width: 1.0)),
      ),
      child: Row(
        spacing: 15,
        children: [
          TextWithIcon(leading: Icon(Icons.calendar_month), text: date.toDateString),
          TextWithIcon(leading: Icon(Icons.schedule), text: '7:30 PM - 8:30 PM'),
        ],
      ),
    );
  }

  Widget _actionButton(BuildContext context) {
    return Row(
      spacing: 30,
      children: [
        // button primary
        ElevatedButton(
          style: context.elevatedButtonTheme.style,
          onPressed: () {},
          child: Text(
            primaryButtonTitle,
            style: context.elevatedButtonTheme.style!.textStyle?.resolve({}),
          ),
        ),
        // button secondary
        if (secondaryButtonTitle != null)
          TextButton(
            style: context.textButtonTheme.style,
            onPressed: () {},
            child: Text(
              secondaryButtonTitle ?? '',
              style: GoogleFonts.epilogue(color: primaryColor, fontWeight: FontWeight.bold),
            ),
          ),
      ],
    );
  }
}
