import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sound_app/utilities/colors.dart';
import 'package:sound_app/utilities/utils.dart';
import 'package:sound_app/views/auth/login_screen.dart';
import 'package:sound_app/widgets/custom_appbar.dart';
import 'package:sound_app/widgets/custom_button.dart';
import 'package:sound_app/widgets/custom_text_widget.dart';
import 'package:sound_app/widgets/custom_textfield.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBarWidget(title: ''),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextWidget(
                text: 'Sign Up',
                fSize: 24,
                fWeight: FontWeight.w700,
                textAlign: TextAlign.center,
                textColor: AppColors.textColor,
              ),
              SizedBox(height: Get.height * 0.02),
              Stack(
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 40,
                    child: Icon(
                      Icons.camera_alt, // You can use any icon you prefer
                      size: 30,
                      color: Colors.grey,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {},
                      child: const CircleAvatar(
                        backgroundColor:
                            Colors.black54, // Customize the button color
                        radius: 15,
                        child: Icon(
                          Icons.file_upload_outlined,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: Get.height * 0.05),
              const CustomTextField(
                hintText: 'Name',
              ),
              SizedBox(height: Get.height * 0.02),
              const CustomTextField(
                hintText: 'Email',
              ),
              SizedBox(height: Get.height * 0.02),
              const CustomTextField(
                hintText: 'Password',
              ),
              SizedBox(height: Get.height * 0.02),
              const CustomTextField(
                hintText: 'Confirm Password',
              ),
              SizedBox(height: Get.height * 0.03),
              CustomButtonWidget(
                buttonText: 'Sign Up',
                onTap: () {},
              ),
              SizedBox(height: Get.height * 0.02),
              InkWell(
                onTap: () {
                  Get.to(const LoginScreen(), transition: Transition.downToUp);
                  Utils().toastMessage('Account created successfully!');
                },
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: GoogleFonts.nunitoSans(
                      color: AppColors.textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                    children: [
                      TextSpan(
                        text: 'Sign in',
                        style: GoogleFonts.nunitoSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: AppColors.textColor),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
