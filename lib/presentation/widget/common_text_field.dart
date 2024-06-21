import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:mvp_app/core/style/colors.dart';

class CommonTextField extends StatefulWidget {
  final String? label;
  final String? hintText;

  const CommonTextField({
    super.key,
    this.label,
    this.hintText,
  });

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 15, right: 10, bottom: 0, top: 0),
        hintText: widget.hintText,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: primaryColor, width: .1),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: primaryColor, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: primaryColor, width: .2),
          borderRadius: BorderRadius.circular(10),
        ),
        hintStyle: GoogleFonts.montserrat(
          color: primaryColor,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
