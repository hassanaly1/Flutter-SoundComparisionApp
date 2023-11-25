import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sound_app/utilities/colors.dart';
import 'package:sound_app/views/auth/otp_screen.dart';
import 'package:sound_app/widgets/custom_appbar.dart';
import 'package:sound_app/widgets/custom_button.dart';
import 'package:sound_app/widgets/custom_text_widget.dart';
import 'package:sound_app/widgets/custom_textfield.dart';

class VerifyNumberScreen extends StatefulWidget {
  CountryCode? countryCode;
  VerifyNumberScreen({super.key});

  @override
  State<VerifyNumberScreen> createState() => _VerifyNumberScreenState();
}

class _VerifyNumberScreenState extends State<VerifyNumberScreen> {
  final countryPicker = FlCountryCodePicker(
    localize: true,
    showDialCode: true,
    showSearchBar: true,
    countryTextStyle: GoogleFonts.nunitoSans(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: AppColors.primaryColor,
    ),
  );

  @override
  void initState() {
    super.initState();
    widget.countryCode = const CountryCode(
      name: 'USA',
      code: '',
      dialCode: '+17',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBarWidget(title: 'Verify Phone Number'),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextWidget(
              text:
                  'We have sent you an SMS with a code to number +17 0123456789.',
              textAlign: TextAlign.center,
              fSize: 16,
              fWeight: FontWeight.w400,
              maxLines: 4,
            ),
            SizedBox(height: Get.height * 0.02),
            Row(
              children: [
                InkWell(
                  onTap: () async {
                    widget.countryCode =
                        await countryPicker.showPicker(context: context);
                    if (widget.countryCode != null) {
                      debugPrint(widget.countryCode!.dialCode);
                    }
                    setState(() {});
                  },
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 13, horizontal: 5),
                      height: 50,
                      width: Get.width * 0.25,
                      decoration: BoxDecoration(
                          color: Color(0xFFEAF0F5),
                          borderRadius: BorderRadius.circular(50.0)),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomTextWidget(
                              // ignore: dead_code
                              text: widget.countryCode?.dialCode ?? "",
                              fSize: 16,
                            ),
                          ],
                        ),
                      )),
                ),
                CustomTextWidget(
                  text: '|',
                  textColor: AppColors.primaryColor,
                  fSize: 70,
                  fWeight: FontWeight.w100,
                ),
                Container(
                    height: 50,
                    width: Get.width * 0.6,
                    child: const CustomTextField(
                      hintText: '123456789',
                    )),
              ],
            ),
            SizedBox(height: Get.height * 0.02),
            CustomButtonWidget(
              buttonText: 'Confirm',
              onTap: () {
                Get.to(OtpScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
