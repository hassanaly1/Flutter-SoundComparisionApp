import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:sound_app/utilities/colors.dart';
import 'package:sound_app/utilities/utils.dart';
import 'package:sound_app/views/home/bottombar.dart';
import 'package:sound_app/widgets/custom_appbar.dart';
import 'package:sound_app/widgets/custom_button.dart';
import 'package:sound_app/widgets/custom_text_widget.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({
    super.key,
  });

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _pinController = TextEditingController();

  bool _timerInProgress = true;
  int _start = 5;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer timer) {
      if (_start == 0) {
        setState(() {
          _timerInProgress = false;
        });
        timer.cancel();
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBarWidget(title: 'OTP Screen'),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                CustomTextWidget(
                  text:
                      'We have sent you an SMS with a code to number +17 0123456789.',
                  fSize: 16,
                  textAlign: TextAlign.center,
                  fWeight: FontWeight.w400,
                  maxLines: 3,
                ),
                const SizedBox(height: 10.0),
                // CustomTextWidget(
                //   text: widget.text,
                //   textColor: const Color(0XFF717784),
                //   fontSize: 15,
                // ),
                const SizedBox(height: 20.0),
                Center(
                  child: Pinput(
                    isCursorAnimationEnabled: true,
                    useNativeKeyboard: true,
                    autofocus: true,
                    closeKeyboardWhenCompleted: true,
                    keyboardType: TextInputType.number,
                    obscureText: true,
                    obscuringCharacter: '*',
                    errorText: 'Pin is incorrect',
                    errorTextStyle:
                        GoogleFonts.poppins(fontSize: 14, color: Colors.red),
                    controller: _pinController,
                    validator: (s) {
                      return s == '2222' ? null : '';
                    },
                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                    showCursor: true,
                    onCompleted: (pin) {
                      if (pin == '2222') {
                        Get.to(const BottomBar(),
                            transition: Transition.downToUp);
                        Utils().toastMessage('Login successfully!');
                      }
                      setState(() {
                        _pinController.clear();
                        _timerInProgress = false;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 20.0),
                const SizedBox(height: 10),
                _timerInProgress
                    ? Center(
                        child: CustomTextWidget(
                          textAlign: TextAlign.center,
                          text: 'Resend OTP in $_start seconds',
                          textColor: const Color(0XFF717784),
                          fSize: 15,
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextWidget(
                            text: 'Didn’t receive the code?',
                            textColor: const Color(0XFF717784),
                            fSize: 15,
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                _timerInProgress = true;
                                _start = 5;
                              });
                              _pinController.clear();
                              startTimer();
                            },
                            child: CustomTextWidget(
                              text: 'Resend',
                              textColor: AppColors.primaryColor,
                              fSize: 15,
                              fWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                const SizedBox(height: 20.0),
                CustomButtonWidget(
                  buttonText: 'Verify',
                  onTap: () {
                    // Validate OTP and perform actions
                    String enteredOTP = _pinController.text;
                    if (enteredOTP.length == 4) {
                      // Perform validation and actions here
                    }
                  },
                ),

                //
              ],
            ),
          ),
        ),
      ),
    );
  }
}
