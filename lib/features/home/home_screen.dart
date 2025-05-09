import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/theme/app_assets.dart';
import '../../common/theme/theme_helper.dart';
import '../../common/utils/extensions/buildcontext_extension.dart';
import 'home_provider.dart';
import 'widget/_button.dart';
import 'widget/_emotion_picker.dart';
import 'widget/_promotion_card.dart';
import 'widget/_quote_card.dart';

class HomeScreen extends HookConsumerWidget {
  final String usernameDisplay;

  const HomeScreen({super.key, this.usernameDisplay = 'Zaie'});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ThemeHelper(context);
    final catFact = ref.watch(catFactProvider);

    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(left: theme.horizontalGapSize),
            child: Text.rich(
              TextSpan(
                text: '${context.tr('greetings.afternoon')},\n',
                style: context.textTheme.headlineMedium,
                children: [
                  TextSpan(
                    text: usernameDisplay,
                    style: context.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, left: theme.horizontalGapSize),
            child: Text(
              context.tr('greetings.feeling_today'),
              style: context.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15),
            child: EmotionPicker(emotions: ref.read(emotionListProvider)),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 20,
              left: theme.horizontalGapSize,
              right: theme.horizontalGapSize,
            ),
            child: PromotionCard(
              title: context.tr('titles.one_on_one_session'),
              description: context.tr('quotes.open_up_feeling'),
              buttonText: context.tr("buttons.book_now"),
              buttonIcon: Icon(Icons.calendar_month),
              image: SvgPicture.asset(AppAssets.meetup),
            ),
          ),
          const SizedBox(height: 25),
          Padding(
            padding: EdgeInsets.only(left: theme.horizontalGapSize, right: theme.horizontalGapSize),
            child: Row(
              spacing: 15,
              children: [
                Expanded(
                  flex: 1,
                  child: Button(context.tr('labels.journal'), icon: Icon(Icons.add_box)),
                ),
                Expanded(
                  flex: 1,
                  child: Button(context.tr('labels.library'), icon: Icon(Icons.library_books)),
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(
              top: 10,
              left: theme.horizontalGapSize,
              right: theme.horizontalGapSize,
            ),
            child: QuoteCard(
              quote: catFact.when(
                data: (fact) => fact,
                error: (e, _) => '"${context.tr('quotes.quote_1')}"',
                loading: () => context.tr('labels.loading'),
              ),
              backgroundColor: Color(0xffF8F6F6),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(
              top: 20,
              left: theme.horizontalGapSize,
              right: theme.horizontalGapSize,
            ),
            child: PromotionCard(
              seedColor: Color(0xff53A06E),
              useOriginalColorOnBackground: true,
              title: context.tr('titles.plan_expired'),
              description: context.tr('messages.get_back_chat_access'),
              buttonText: context.tr('buttons.buy_more'),
              buttonIcon: Icon(Icons.keyboard_double_arrow_right),
              image: SvgPicture.asset(AppAssets.meditation),
            ),
          ),
          SizedBox(height: theme.bottomGapSize),
        ],
      ),
    );
  }
}
