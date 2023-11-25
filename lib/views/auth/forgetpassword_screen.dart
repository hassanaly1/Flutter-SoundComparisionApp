import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sound_app/utilities/colors.dart';
import 'package:sound_app/views/auth/login_screen.dart';
import 'package:sound_app/widgets/custom_button.dart';
import 'package:sound_app/widgets/custom_text_widget.dart';
import 'package:sound_app/widgets/custom_textfield.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            CustomTextWidget(
              text:
                  'Please enter your email address. You will receive a link to create a new password via email.',
              fSize: 18,
              textAlign: TextAlign.center,
              fWeight: FontWeight.w400,
              textColor: AppColors.textColor,
              maxLines: 4,
            ),
            const SizedBox(height: 30),
            const CustomTextField(
              hintText: 'Email',
            ),
            const SizedBox(height: 30),
            CustomButtonWidget(
              buttonText: 'Send',
              onTap: () {
                Get.to(const LoginScreen(), transition: Transition.rightToLeft);
              },
            )
          ],
        ),
      ),
    );
  }
}
