import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final Color fillColor;
  const CustomTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.fillColor = const Color(0xFFEAF0F5),
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor,
        hintStyle: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.grey,
        ),
        border: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(50.0), // Adjust the radius as needed
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(20.0), // Adjust the radius as needed
          borderSide: BorderSide(color: Colors.black),
        ),
        hintText: hintText,
      ),
    );
  }
}
