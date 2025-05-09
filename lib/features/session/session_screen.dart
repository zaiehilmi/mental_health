import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:schedule_management/common/utils/extensions/buildcontext_extension.dart';

import '../../common/theme/theme_helper.dart';
import '../../common/widget/enhanced_card.dart';
import '../../common/widget/text_with_icon.dart';
import 'widget/_scheduled_session_card.dart';

const List<String> _viewOptions = <String>[
  'labels.sessions_filter.all',
  'labels.sessions_filter.this_week',
  'labels.sessions_filter.this_month',
  'labels.sessions_filter.past',
];

class SessionScreen extends HookWidget {
  final List<String> viewOptions;

  const SessionScreen({super.key, this.viewOptions = _viewOptions});

  @override
  Widget build(BuildContext context) {
    final theme = ThemeHelper(context);

    final selectedView = useState(0);

    void onPressPicker() {
      _showDialog(
        context,
        child: CupertinoPicker(
          itemExtent: 32.0,
          onSelectedItemChanged: (value) => selectedView.value = value,
          scrollController: FixedExtentScrollController(initialItem: selectedView.value),
          children: List<Widget>.generate(viewOptions.length, (index) {
            return Center(
              child: Text(context.tr(viewOptions[index]), style: context.textTheme.titleMedium),
            );
          }),
        ),
      );
    }

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: theme.horizontalGapSize),
        child: ListView(
          children: [
            EnhancedCard(
              title: Text(context.tr('titles.upcoming_session')),
              description: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  Text('Sahana V, Msc in Clinical Psychology', style: context.textTheme.labelSmall),
                  Text(
                    '7:30 PM - 8:30 PM',
                    style: context.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              action: TextButton(
                onPressed: () {},
                child: TextWithIcon(
                  text: context.tr('buttons.join_now'),
                  trailing: Icon(Icons.play_circle_fill),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: onPressPicker,
                    child: TextWithIcon(
                      text: context.tr(viewOptions[selectedView.value]),
                      trailing: Icon(CupertinoIcons.chevron_down),
                    ),
                  ),

                  IconButton(onPressed: () {}, icon: Icon(Icons.sort)),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 18, bottom: theme.bottomGapSize),
              child: Builder(
                builder: (context) {
                  return Column(
                    children: List.generate(
                      viewOptions.length,
                      (index) => Padding(
                        padding: EdgeInsets.only(bottom: index < viewOptions.length - 1 ? 18 : 0),
                        child: ScheduledSessionCard(
                          physiatristName: 'Sahana V',
                          physiatristDomain: 'Msc in Clinical Psychology',
                          date: DateTime(2025, DateTime.august, DateTime.friday, 20),
                          startTime: DateTime(2025, DateTime.august, DateTime.friday, 20),
                          primaryButtonTitle: context.tr('buttons.reschedule'),
                          secondaryButtonTitle: context.tr('buttons.join_now'),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog(BuildContext context, {required Widget child}) {
    showCupertinoModalPopup<void>(
      context: context,
      builder:
          (context) => Container(
            height: 250,
            padding: const EdgeInsets.only(top: 6.0),
            margin: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
            color: CupertinoColors.systemBackground.resolveFrom(context),
            child: SafeArea(top: false, child: child),
          ),
    );
  }
}
