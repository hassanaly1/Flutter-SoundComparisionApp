import 'package:flutter/material.dart';
import 'package:sound_app/utilities/colors.dart';
import 'package:sound_app/widgets/custom_button.dart';
import 'package:sound_app/widgets/custom_text_widget.dart';
import 'package:sound_app/widgets/custom_textfield.dart';

class AccountInfo extends StatelessWidget {
  const AccountInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextWidget(
                text: 'Account info',
                fSize: 20,
                fWeight: FontWeight.w700,
              ),
              const SizedBox(height: 10),
              ClipOval(
                child: Image.asset(
                  'assets/images/user.jpg',
                  height: 80,
                ),
              ),
              const SizedBox(height: 10),
              CustomTextWidget(
                text: 'Basic info',
                fSize: 16,
                fWeight: FontWeight.w500,
              ),
              const ReUsableAccountInfoWidget(
                infoType: 'Name',
                infoValue: 'Ammar',
              ),
              const ReUsableAccountInfoWidget(
                infoType: 'Phone Number',
                infoValue: '1232134',
              ),
              const ReUsableAccountInfoWidget(
                infoType: 'Email',
                infoValue: 'abc@gmail.com',
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomButtonWidget(
        buttonText: 'Save',
        onTap: () {},
      ),
    );
  }
}

class ReUsableAccountInfoWidget extends StatelessWidget {
  final String infoType;
  final String infoValue;

  const ReUsableAccountInfoWidget({
    Key? key,
    required this.infoType,
    required this.infoValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextWidget(
            text: infoType,
            fSize: 16,
            fWeight: FontWeight.w300,
          ),
          const SizedBox(height: 5),
          CustomTextField(hintText: infoValue)
        ],
      ),
    );
  }
}
