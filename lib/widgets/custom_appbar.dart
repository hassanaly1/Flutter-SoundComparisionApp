import 'package:flutter/material.dart';

import 'custom_text_widget.dart';

AppBar CustomAppBarWidget(
    {required String title,
    List<Widget>? action,
    Widget? leading,
    bool? automaticallyImplyLeading}) {
  return AppBar(
    forceMaterialTransparency: true,
    automaticallyImplyLeading: automaticallyImplyLeading ?? true,

    title: CustomTextWidget(text: title, fSize: 16.0, fWeight: FontWeight.w700),
    centerTitle: true,
    //  backgroundColor: AppColors.backgroundColor,
    elevation: 0,
    actions: action,
  );
}
