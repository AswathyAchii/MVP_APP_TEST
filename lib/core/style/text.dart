import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

///-------- TEXT WIDGETS --------///

class TextWidgets {
  static Text heading({required String text, Color? color, double? fontSize}) {
    return Text(
      text,
      style: GoogleFonts.montserrat(
        color: color ?? primaryColor,
        fontSize: fontSize ?? 22,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  static Text subHeading({required String text, Color? color, double? fontSize}) {
    return Text(
      text,
      style: GoogleFonts.montserrat(
        color: color ?? primaryColor,
        fontSize: fontSize ?? 20,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  static Text bodyText({required String text, Color? color, double? fontSize}) {
    return Text(
      text,
      style: GoogleFonts.montserrat(
        color: color ?? primaryColor,
        fontSize: fontSize ?? 12,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  static Text bodyText1({required String text, Color? color, double? fontSize}) {
    return Text(
      text,
      style: GoogleFonts.montserrat(
        color: color ?? primaryColor,
        fontSize: fontSize ?? 12,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
