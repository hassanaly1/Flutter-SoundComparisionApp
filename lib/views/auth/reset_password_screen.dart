import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sound_app/widgets/custom_button.dart';
import 'package:sound_app/widgets/custom_text_widget.dart';
import 'package:sound_app/widgets/custom_textfield.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextWidget(
              text: 'Enter new password and confirm.',
              textAlign: TextAlign.center,
              fSize: 16,
              fWeight: FontWeight.w400,
            ),
            SizedBox(height: Get.height * 0.02),
            const CustomTextField(
              hintText: 'Password',
            ),
            SizedBox(height: Get.height * 0.02),
            const CustomTextField(
              hintText: 'Confirm Password',
            ),
            SizedBox(height: Get.height * 0.02),
            CustomButtonWidget(
              buttonText: 'Change Password',
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
