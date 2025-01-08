import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle h1({Color? color, FontWeight? fontWeight = FontWeight.w900}) => GoogleFonts.instrumentSans(
        color: color,
        fontSize: 48,
        fontWeight: fontWeight,
        height: 1.30,
      );

  static TextStyle h2({Color? color, FontWeight? fontWeight = FontWeight.bold}) => GoogleFonts.instrumentSans(
        color: color,
        fontSize: 32,
        fontWeight: fontWeight,
        height: 1.25,
      );

  static TextStyle h3({Color? color, FontWeight? fontWeight = FontWeight.w600}) => GoogleFonts.instrumentSans(
        color: color,
        fontSize: 24,
        fontWeight: fontWeight,
      );

  static TextStyle h4({Color? color, FontWeight? fontWeight = FontWeight.w600}) => GoogleFonts.instrumentSans(
        color: color,
        fontSize: 20,
        fontWeight: fontWeight,
      );

  static TextStyle h5({Color? color, FontWeight? fontWeight}) => GoogleFonts.instrumentSans(
        color: color,
        fontSize: 18,
        fontWeight: fontWeight,
      );

  static TextStyle h6({Color? color, FontWeight? fontWeight}) => GoogleFonts.instrumentSans(
        color: color,
        fontSize: 16,
        fontWeight: fontWeight,
      );

  static TextStyle h7({Color? color, FontWeight? fontWeight}) => GoogleFonts.instrumentSans(
        color: color,
        fontSize: 14,
        fontWeight: fontWeight,
      );

  static TextStyle h8({Color? color, FontWeight? fontWeight}) => GoogleFonts.instrumentSans(
        color: color,
        fontSize: 12,
        fontWeight: fontWeight,
      );

  static TextStyle h9({Color? color, FontWeight? fontWeight}) => GoogleFonts.instrumentSans(
        color: color,
        fontSize: 10,
        fontWeight: fontWeight,
      );
}
