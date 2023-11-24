import 'package:flutter/material.dart';
import 'package:sound_app/widgets/custom_text_widget.dart';

class CustomChallengeContainer extends StatelessWidget {
  final String challengeName;
  final int challengeMembersCount;
  final Color color;

  const CustomChallengeContainer({
    required this.challengeName,
    required this.challengeMembersCount,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextWidget(
              text: challengeName,
              fWeight: FontWeight.w700,
              fSize: 20,
            ),
            CustomTextWidget(
              text: '$challengeMembersCount Members',
              fWeight: FontWeight.w300,
              fSize: 16,
            ),
          ],
        ),
      ),
    );
  }
}
