import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schedule_management/common/theme/theme_data.dart';
import 'package:schedule_management/common/utils/extensions/buildcontext_extension.dart';

class FilterPill extends HookWidget {
  final String label;
  final bool isSelected;
  final ValueChanged<bool>? onSelected;

  const FilterPill({super.key, required this.label, this.isSelected = false, this.onSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(label),
        selected: isSelected,
        onSelected: onSelected,
        backgroundColor: Color(0xffF4F2F1),
        selectedColor: primaryColor,
        checkmarkColor: context.colorScheme.onPrimaryFixed,
        labelStyle: GoogleFonts.epilogue(
          color: isSelected ? Colors.white : Colors.black87,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
