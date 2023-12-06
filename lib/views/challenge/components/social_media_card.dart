import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sound_app/widgets/custom_text_widget.dart';

class SocialMediaCard extends StatelessWidget {
  final String imagePath;
  final String appName;

  const SocialMediaCard(this.imagePath, this.appName, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SvgPicture.asset(
            imagePath,
            width: 60,
            height: 60,
            // Adjust width and height as needed
          ),
          const SizedBox(height: 8),
          CustomTextWidget(text: appName),
        ],
      ),
    );
  }
}
