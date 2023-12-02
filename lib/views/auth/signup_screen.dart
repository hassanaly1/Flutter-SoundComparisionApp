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

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
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
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      hintText: 'Name',
                      controller: nameController,
                    ),
                    SizedBox(height: Get.height * 0.02),
                    CustomTextField(
                      hintText: 'Email',
                      controller: emailController,
                    ),
                    SizedBox(height: Get.height * 0.02),
                    CustomTextField(
                      hintText: 'Password',
                      controller: passwordController,
                    ),
                    SizedBox(height: Get.height * 0.02),
                    CustomTextField(
                      hintText: 'Confirm Password',
                      controller: confirmPasswordController,
                    ),
                  ],
                ),
              ),
              SizedBox(height: Get.height * 0.03),
              CustomButtonWidget(
                buttonText: 'Sign Up',
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    Get.offAll(const LoginScreen(),
                        transition: Transition.leftToRight);
                    Utils().toastMessage('Account created successfully!');
                  }
                },
              ),
              SizedBox(height: Get.height * 0.02),
              InkWell(
                onTap: () {
                  Get.to(const LoginScreen(),
                      transition: Transition.leftToRight);
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
