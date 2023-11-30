import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSearchBar extends StatelessWidget {
  final ValueChanged<String>? onChanged;

  const CustomSearchBar({
    Key? key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.grey[200],
        ),
        child: Row(
          children: [
            SvgPicture.asset('assets/images/icon-search.svg'),
            SizedBox(width: 15.0),
            Expanded(
              child: TextField(
                onChanged: onChanged,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search',
                  hintStyle: GoogleFonts.poppins(
                    color: Colors.black87,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                style: GoogleFonts.poppins(
                  color: Colors.black87,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
