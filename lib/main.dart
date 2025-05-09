import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_yaml/easy_localization_yaml.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:schedule_management/config/env.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'features/dashboard_navigation.dart';
import 'common/theme/theme_data.dart';

final talker = TalkerFlutter.init();

const List<Locale> _supportedLocales = [Locale('en'), Locale('ms', 'MY'), Locale('ja')];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  Env.init();
  talker.info('App started in ${Env.env}');

  runApp(
    ProviderScope(
      child: EasyLocalization(
        supportedLocales: _supportedLocales,
        path: 'assets/translations',
        assetLoader: YamlAssetLoader(directory: 'assets/translations'),
        fallbackLocale: const Locale('en'),
        child: const MainApp(),
      ),
    ),
  );
}

class MainApp extends HookWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: temaAplikasi,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: DashboardNavigation(),
    );
  }
}
