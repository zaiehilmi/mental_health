import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:schedule_management/features/community/community_provider.dart';

import 'widget/_list_tile.dart';
import 'widget/_filter_pill.dart';

class CommunityScreen extends HookConsumerWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    final isFilterVisible = useState(true);
    final lastScrollPosition = useState(0.0);

    // Listen to scroll events to determine scroll direction
    void handleScroll() {
      // Always show filter when at or very near the top of the list
      if (scrollController.position.pixels <= 10) {
        // Allow a small threshold
        if (!isFilterVisible.value) {
          isFilterVisible.value = true;
        }
        lastScrollPosition.value = scrollController.position.pixels;
        return;
      }

      // Determine scroll direction with a small threshold for better detection
      final isScrollingUp = scrollController.position.pixels < (lastScrollPosition.value - 1.0);

      // Make visibility changes more immediate
      if (isScrollingUp && !isFilterVisible.value) {
        isFilterVisible.value = true;
      } else if (!isScrollingUp && scrollController.position.pixels > 20 && isFilterVisible.value) {
        // Only hide when we've scrolled down a bit
        isFilterVisible.value = false;
      }

      // Update last scroll position
      lastScrollPosition.value = scrollController.position.pixels;
    }

    useEffect(() {
      scrollController.addListener(handleScroll);

      return () => scrollController.removeListener(handleScroll);
    }, [scrollController]);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.tr('titles.navigations.wellness_hub'),
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),
        centerTitle: false,
        toolbarHeight: 30,
      ),
      body: Column(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: isFilterVisible.value ? 50 : 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children:
                      ref.read(filterListProvider).asMap().entries.map((entry) {
                        final index = entry.key;
                        final filter = entry.value;

                        return FilterPill(
                          label: context.tr(filter),
                          isSelected: index == 0, // hanya yang pertama akan true
                        );
                      }).toList(),
                ),
              ),
            ),
          ),

          // Main content
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              itemCount: 20, // Example item count
              itemBuilder: (context, index) {
                return HubListTile(
                  userHandle: 'User $index',
                  onTapPost: () => print('Tapped on user $index'),
                  postText:
                      'This is a sample post description for user $index lalal yeay foafnds asdnala qweoqwipe fbasdksalk',
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.edit), onPressed: () {}),
    );
  }
}
