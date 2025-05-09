import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schedule_management/common/theme/theme_data.dart';
import 'package:schedule_management/common/utils/extensions/datetime_extension.dart';

class HubListTile extends HookWidget {
  final String userHandle;
  final DateTime? date; // to be translated to friendly time
  final String postText;
  final bool? liked;
  final bool? commented;
  final int? totalLikes;
  final int? totalComments;
  final VoidCallback? onTapPost;
  final VoidCallback? onTapLike;
  final VoidCallback? onTapComment;
  final VoidCallback? onTapShare;

  const HubListTile({
    super.key,
    required this.userHandle,
    required this.postText,
    this.date,
    this.liked = false,
    this.commented = false,
    this.totalLikes = 0,
    this.totalComments = 0,
    this.onTapPost,
    this.onTapLike,
    this.onTapComment,
    this.onTapShare,
  });

  @override
  Widget build(BuildContext context) {
    final isLiked = useState(liked!);
    final likeCount = useState(totalLikes ?? 0);
    final isCommented = useState(commented!);
    final commentCount = useState(totalComments ?? 0);

    // Generic handler for interaction (like or comment)
    void handleInteraction({
      required ValueNotifier<bool> isInteractedState,
      required ValueNotifier<int> countState,
      VoidCallback? callback,
    }) {
      // Toggle interaction state
      isInteractedState.value = !isInteractedState.value;

      // Update count based on new state
      countState.value = isInteractedState.value ? countState.value + 1 : countState.value - 1;

      // Call the provided callback if it exists
      if (callback != null) {
        callback();
      }
    }

    return GestureDetector(
      onTap: onTapPost,
      child: Container(
        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Color(0x4dD9D8D8)))),
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Padding(
          padding: const EdgeInsets.only(right: 20, bottom: 10, top: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              Expanded(flex: 1, child: CircleAvatar()),
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _userhandleWithFriendlyTime(),
                    Text(postText, style: GoogleFonts.rubik(fontSize: 13)),
                    _actionButtonsRow(
                      isLiked: isLiked.value,
                      totalLikes: likeCount.value,
                      onTapLike:
                          () => handleInteraction(
                            isInteractedState: isLiked,
                            countState: likeCount,
                            callback: onTapLike,
                          ),
                      isCommented: isCommented.value,
                      totalComments: commentCount.value,
                      onTapComment:
                          () => handleInteraction(
                            isInteractedState: isCommented,
                            countState: commentCount,
                            callback: onTapComment,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _userhandleWithFriendlyTime() {
    final $timeColor = Color(0xff707070);
    return Row(
      children: [
        Text(userHandle, style: GoogleFonts.rubik(fontSize: 14, fontWeight: FontWeight.w500)),
        Text(' • ', style: TextStyle(color: $timeColor)),
        Text(
          date?.toFriendlyTime ?? 'just now',
          style: GoogleFonts.rubik(fontSize: 12, color: $timeColor),
        ),
      ],
    );
  }

  Widget _actionButton({
    bool isInteracted = false,
    int? totalInteractions,
    required VoidCallback onTap,
    required IconData icon,
  }) {
    final $interactedColor = isInteracted ? primaryColor : Color(0xffD6CCC6);

    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        spacing: 10,
        children: [
          GestureDetector(onTap: onTap, child: Icon(icon, size: 20, color: $interactedColor)),
          if (totalInteractions != null)
            Text(
              totalInteractions.toString(),
              style: GoogleFonts.rubik(fontSize: 13.33, color: Color(0xff707070)),
            ),
        ],
      ),
    );
  }

  Widget _actionButtonsRow({
    bool isLiked = false,
    int totalLikes = 0,
    VoidCallback? onTapLike,
    bool isCommented = false,
    int totalComments = 0,
    VoidCallback? onTapComment,
  }) {
    return Row(
      spacing: 30,
      children: [
        _actionButton(
          isInteracted: isLiked,
          totalInteractions: totalLikes,
          onTap: onTapLike ?? () {},
          icon: CupertinoIcons.hand_thumbsup,
        ),
        _actionButton(
          isInteracted: isCommented,
          totalInteractions: totalComments,
          onTap: onTapComment ?? () {},
          icon: Icons.chat_outlined,
        ),
        Spacer(),
        _actionButton(isInteracted: false, onTap: () {}, icon: CupertinoIcons.share),
      ],
    );
  }
}
