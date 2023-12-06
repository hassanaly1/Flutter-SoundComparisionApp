import 'package:flutter/material.dart';
import 'package:sound_app/widgets/custom_text_widget.dart';

class CustomUserCard extends StatelessWidget {
  final String imagePath;
  final String appName;

  const CustomUserCard(this.imagePath, this.appName, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ClipOval(
            child: Image.asset(
              fit: BoxFit.cover,
              imagePath,
              width: 80.0,
              height: 80.0,
            ),
          ),
          const SizedBox(height: 8),
          CustomTextWidget(
            text: appName,
            fSize: 14.0,
          ),
        ],
      ),
    );
  }
}
