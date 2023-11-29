import 'package:flutter/material.dart';
import 'package:sound_app/widgets/custom_text_widget.dart';

class ReUsableProfileTabs extends StatelessWidget {
  final String text;
  final IconData icon;
  final Widget suffix;
  final VoidCallback onTap;
  const ReUsableProfileTabs(
      {super.key,
      required this.text,
      required this.onTap,
      required this.icon,
      required this.suffix});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 10),
            CustomTextWidget(
              text: text,
              fSize: 16,
              fWeight: FontWeight.w500,
            ),
            const Spacer(),
            suffix,
          ],
        ),
      ),
    );
  }
}
