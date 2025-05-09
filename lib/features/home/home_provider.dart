import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/services/api_service.dart';
import '../../common/theme/app_assets.dart';
import 'home_service.dart';
import 'widget/_emotion_picker.dart';

final _homeServiceProvider = Provider((ref) => HomeService(ref.watch(apiServiceProvider)));

final catFactProvider = FutureProvider((ref) async {
  final service = ref.watch(_homeServiceProvider);
  return service.getFact();
});

final emotionListProvider = Provider(
  (ref) => [
    Emotion(name: 'labels.feelings.happy', icon: AppAssets.happy, color: Color(0xffEF5DA8)),
    Emotion(name: 'labels.feelings.calm', icon: AppAssets.calm, color: Color(0xffAEAFF7)),
    Emotion(name: 'labels.feelings.relax', icon: AppAssets.relax, color: Color(0xffA0E3E2)),
    Emotion(name: 'labels.feelings.angry', icon: AppAssets.angry, color: Color(0xffF09E54)),
    Emotion(name: 'labels.feelings.relax', icon: AppAssets.relax, color: Color(0xffA0E3E2)),
    Emotion(name: 'labels.feelings.angry', icon: AppAssets.angry, color: Color(0xffF09E54)),
  ],
);
