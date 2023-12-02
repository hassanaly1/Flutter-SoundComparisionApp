import 'package:flutter/material.dart';
import 'package:sound_app/widgets/custom_text_widget.dart';
import 'package:sound_app/widgets/custom_textfield.dart';

Future<dynamic> buildEditInfoDialog(BuildContext context) {
  TextEditingController nameController = TextEditingController();
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.grey.shade200,
        title: CustomTextWidget(
          text: 'Edit Challenge Info',
          fSize: 16.0,
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipOval(
                child: Image.asset('assets/images/user.jpg', height: 80),
              ),
              const SizedBox(height: 15.0),
              CustomTextField(
                hintText: 'Tone Twisters',
                controller: nameController,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: CustomTextWidget(
              text: 'Cancel',
              textColor: Colors.redAccent,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              debugPrint('Updated Name: ${nameController.text}');
              Navigator.of(context).pop();
            },
            child: CustomTextWidget(text: 'Save'),
          ),
        ],
      );
    },
  );
}
