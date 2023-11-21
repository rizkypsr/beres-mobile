import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';

class TitleText extends StatelessWidget {
  final String? text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  const TitleText(
      {Key? key,
      this.text,
      this.fontSize = 18,
      this.color = Colors.black54,
      this.fontWeight = FontWeight.w800})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w800, color: Colors.black54),
      // style: GoogleFonts.mulish(
      //   fontSize: fontSize, fontWeight: fontWeight, color: color)
    );
  }
}
