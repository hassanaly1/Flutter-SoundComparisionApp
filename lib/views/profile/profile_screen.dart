import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sound_app/utilities/colors.dart';
import 'package:sound_app/views/auth/login_screen.dart';
import 'package:sound_app/views/profile/account_info.dart';
import 'package:sound_app/widgets/custom_appbar.dart';
import 'package:sound_app/widgets/custom_text_widget.dart';
import 'package:sound_app/widgets/reusable_profile_tabs.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
  bool isMode = false;
  bool isNotification = false;
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBarWidget(
        title: 'Profile',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            ClipOval(
              child: Image.asset('assets/images/user.jpg', height: 80),
            ),
            const SizedBox(height: 5),
            CustomTextWidget(
                text: 'Ammar', fWeight: FontWeight.w500, fSize: 18),
            CustomTextWidget(
                text: 'abc@gmail.com', fWeight: FontWeight.w200, fSize: 14),
            const Divider(),
            ReUsableProfileTabs(
                text: 'Profile',
                suffix: Icon(Icons.arrow_forward_rounded),
                onTap: () {
                  Get.to(AccountInfo(), transition: Transition.rightToLeft);
                },
                icon: Icons.person_2_rounded),
            ReUsableProfileTabs(
                text: 'Mode',
                suffix: Switch(
                  value: widget.isMode,
                  onChanged: (value) {
                    setState(() {
                      widget.isMode = value;
                    });
                  },
                ),
                onTap: () {
                  Get.to(AccountInfo(), transition: Transition.rightToLeft);
                },
                icon: Icons.dark_mode),
            ReUsableProfileTabs(
                text: 'Notifications',
                suffix: Switch(
                  value: widget.isNotification,
                  onChanged: (value) {
                    setState(() {
                      widget.isNotification = value;
                    });
                  },
                ),
                onTap: () {
                  Get.to(AccountInfo(), transition: Transition.rightToLeft);
                },
                icon: Icons.notification_add_outlined),
            ReUsableProfileTabs(
                text: 'Logout',
                suffix: Icon(Icons.arrow_forward_rounded),
                onTap: () => Get.to(const LoginScreen(),
                    transition: Transition.downToUp),
                icon: Icons.login_rounded),
          ],
        ),
      ),
    );
  }
}
