import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../theme/app_assets.dart';

class AvatarIcon extends HookWidget {
  final String? imageUri;
  final EdgeInsetsGeometry? margin;

  const AvatarIcon({
    super.key,
    this.imageUri = AppAssets.dummyAvatar,
    this.margin = const EdgeInsets.only(left: 16),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Color(0xFFF09E54).withValues(alpha: .47), width: 5),
      ),
      height: 35,
      width: 35,
      margin: margin,
      clipBehavior: Clip.antiAlias,
      child: CircleAvatar(backgroundImage: AssetImage(imageUri ?? AppAssets.dummyAvatar)),
    );
  }
}
