import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sound_app/utilities/colors.dart';
import 'package:sound_app/widgets/custom_text_widget.dart';

class CustomButtonWidget extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;
  final Color? buttonColor;
  final Color? textColor;
  final double? width;
  const CustomButtonWidget(
      {super.key,
      required this.buttonText,
      required this.onTap,
      this.width,
      this.buttonColor = AppColors.primaryColor,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            height: context.isLandscape ? 35 : 30,
            width: width,
            decoration: BoxDecoration(
              color: buttonColor,
            ),
            child: Center(
                child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: CustomTextWidget(
                text: buttonText,
                fSize: context.isLandscape ? 14 : 12,
                textColor: textColor ?? Colors.white,
                fWeight: FontWeight.w300,
              ),
            ))),
      ),
    );
  }
}
