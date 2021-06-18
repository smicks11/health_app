import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText2 extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight weight;

  const CustomText2(
      {Key key,
      @required this.text,
      @required this.size,
      @required this.color,
      this.weight})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.sourceCodePro(
          textStyle: TextStyle(
              fontSize: size ?? 16,
              color: color ?? Colors.black,
              fontWeight: weight ?? FontWeight.normal),
        ));
  }
}
