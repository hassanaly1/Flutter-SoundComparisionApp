import 'package:flutter/material.dart';
import 'package:sound_app/widgets/custom_text_widget.dart';

Widget CustomPrizeWidget({
  required String image,
  required String name,
  required String similarity,
  required String trailingImage,
}) {
  return ListTile(
    leading: CircleAvatar(
      backgroundColor: Colors.red,
      backgroundImage: AssetImage('assets/images/$image'),
    ),
    title: CustomTextWidget(
      text: name,
      fWeight: FontWeight.w400,
      fSize: 14.0,
    ),
    subtitle: Row(
      children: [
        CustomTextWidget(
          text: 'Similarity: ',
          fSize: 12.0,
        ),
        CustomTextWidget(
          text: '$similarity / 100',
          fSize: 12.0,
        ),
      ],
    ),
    trailing: Image.asset('assets/images/$trailingImage'),
  );
}
