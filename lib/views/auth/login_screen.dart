// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sound_app/utilities/colors.dart';
import 'package:sound_app/utilities/utils.dart';
import 'package:sound_app/views/auth/verify_number_screen.dart';
import 'package:sound_app/views/home/bottombar.dart';
import 'package:sound_app/widgets/custom_button.dart';
import 'package:sound_app/widgets/custom_text_widget.dart';
import 'package:sound_app/widgets/custom_textfield.dart';

import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: Get.height * 0.05),
              CustomTextWidget(
                text: 'Welcome Back!',
                fSize: 24,
                fWeight: FontWeight.w700,
                textAlign: TextAlign.center,
                textColor: AppColors.textColor,
              ),
              SizedBox(height: Get.height * 0.02),
              CustomTextWidget(
                text: 'Sign in to continue',
                fSize: 16,
                fWeight: FontWeight.w400,
                textAlign: TextAlign.center,
                textColor: AppColors.textColor,
              ),
              SizedBox(height: Get.height * 0.05),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFEAF0F5),
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/images/facebook-logo.png',
                      height: 30,
                    ),
                    CustomTextWidget(
                      text: 'Login with Facebook',
                      fSize: 16.0,
                    ),
                    Visibility(
                        visible: false,
                        child: Image.asset('assets/images/facebook-logo.png')),
                  ],
                ),
              ),
              SizedBox(height: Get.height * 0.05),
              CustomTextWidget(
                text: 'or login with your information',
                fSize: 16,
                fWeight: FontWeight.w400,
                textAlign: TextAlign.center,
                textColor: AppColors.textColor,
              ),
              SizedBox(height: Get.height * 0.02),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      hintText: 'Email',
                      controller: emailController,
                    ),
                    SizedBox(height: Get.height * 0.02),
                    CustomTextField(
                      hintText: 'Password',
                      controller: passwordController,
                    ),
                  ],
                ),
              ),
              SizedBox(height: Get.height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isChecked = !isChecked;
                          });
                        },
                        icon: Icon(isChecked
                            ? Icons.check_box_rounded
                            : Icons.check_box_outline_blank),
                      ),
                      const SizedBox(width: 5),
                      CustomTextWidget(
                        text: 'Remember Me',
                        fSize: 14.0,
                        fWeight: FontWeight.w500,
                        textColor: AppColors.textColor,
                      )
                    ],
                  ),
                  TextButton(
                      onPressed: () {
                        Get.to(VerifyNumberScreen(),
                            transition: Transition.downToUp);
                      },
                      child: CustomTextWidget(
                        text: 'Forgot password?',
                        fWeight: FontWeight.w500,
                        fSize: 14.0,
                        textColor: AppColors.textColor,
                      ))
                ],
              ),
              SizedBox(height: Get.height * 0.03),
              CustomButtonWidget(
                buttonText: 'Sign in',
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    Get.offAll(const BottomBar(),
                        transition: Transition.downToUp);
                    Utils().toastMessage('Login successfully!');
                  }
                },
              ),
              SizedBox(height: Get.height * 0.02),
              InkWell(
                onTap: () {
                  Get.to(const SignupScreen(),
                      transition: Transition.rightToLeft);
                },
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: GoogleFonts.nunitoSans(
                      color: AppColors.textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                    children: [
                      TextSpan(
                        text: 'Sign up',
                        style: GoogleFonts.nunitoSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: AppColors.textColor),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: Get.height * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
