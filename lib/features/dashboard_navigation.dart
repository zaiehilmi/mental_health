import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:schedule_management/common/theme/theme_data.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

import '../common/theme/app_assets.dart';
import '../common/theme/theme_helper.dart';
import '../common/utils/extensions/buildcontext_extension.dart';
import '../common/widget/avatar_icon.dart';
import 'community/community_screen.dart';
import 'home/home_screen.dart';
import 'session/session_screen.dart';

final List<BarItem> destinations = [
  BarItem(filledIcon: Icons.home_filled, outlinedIcon: Icons.home_outlined),
  BarItem(filledIcon: Icons.video_call, outlinedIcon: Icons.video_call_outlined),
  BarItem(filledIcon: Icons.chat, outlinedIcon: Icons.chat_outlined),
  BarItem(filledIcon: CupertinoIcons.person_2_fill, outlinedIcon: CupertinoIcons.person_2),
];

final List<Widget> destinationBodies = [
  HomeScreen(),
  SessionScreen(),
  Center(child: Text("Chat")),
  CommunityScreen(),
];

class DashboardNavigation extends HookWidget {
  const DashboardNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ThemeHelper(context);

    final navigationIndex = useState(0);
    final notificationCount = useState('3');

    return Scaffold(
      appBar: AppBar(
        leading: AvatarIcon(),
        leadingWidth: 70,
        actionsPadding: EdgeInsets.only(right: theme.horizontalGapSize),
        actions: [
          Badge(
            label: Text(
              notificationCount.value,
              style: context.textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            backgroundColor: context.colorScheme.primary,
            largeSize: 22,
            offset: Offset(0, 5),
            child: IconButton(onPressed: () {}, icon: SvgPicture.asset(AppAssets.bell)),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: destinationBodies[navigationIndex.value],
      bottomNavigationBar: WaterDropNavBar(
        barItems: destinations,
        waterDropColor: primaryColor,
        backgroundColor: Colors.white,
        inactiveIconColor: Color(0xffD9D8D8),
        selectedIndex: navigationIndex.value,
        onItemSelected: (value) => navigationIndex.value = value,
      ),
    );
  }
}
