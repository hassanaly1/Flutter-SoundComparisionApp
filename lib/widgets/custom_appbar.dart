import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sound_app/utilities/colors.dart';

import 'custom_text_widget.dart';

AppBar CustomAppBarWidget(
    {required String title,
    List<Widget>? action,
    Widget? leading,
    bool? automaticallyImplyLeading}) {
  return AppBar(
    forceMaterialTransparency: true,
    automaticallyImplyLeading: automaticallyImplyLeading ?? true,

    title: CustomTextWidget(text: title, fSize: 20.0, fWeight: FontWeight.w700),
    centerTitle: true,
    //  backgroundColor: AppColors.backgroundColor,
    elevation: 0,
    actions: action,
  );
}

AppBar DoctorCustomAppBarWidget(
    {required String title,
    Color? textColor,
    List<Widget>? action,
    bool? automaticallyImplyLeading}) {
  return AppBar(
    automaticallyImplyLeading: automaticallyImplyLeading ?? true,
    iconTheme: IconThemeData(color: Colors.black26),
    leading: IconButton(
      onPressed: () {
        Get.back();
      },
      icon: const Icon(Icons.arrow_back_ios_new_rounded),
    ),
    title: CustomTextWidget(
      text: title,
      fSize: 20.0,
      fWeight: FontWeight.w700,
      textColor: textColor ?? AppColors.primaryColor,
    ),
    centerTitle: true,
    backgroundColor: AppColors.backgroundColor,
    elevation: 0,
    actions: action,
  );
}
