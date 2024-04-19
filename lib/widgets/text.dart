import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Heading extends StatelessWidget {

  final String text;
  final Color color;
  final TextAlign align;
  final double fontSize;
  final FontWeight weight;

  const Heading({
    super.key, 
    required this.text,
    this.color = Colors.black87,
    this.weight = FontWeight.bold,
    this.align = TextAlign.left,
    this.fontSize = 18,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.montserrat(
        fontSize: fontSize,
        fontWeight: weight,
        color: color,
      ),
      textAlign: align,
      maxLines: 3,
    );
  }

}

class SubHeading extends StatelessWidget {

  final String text;
  final Color color;
  final TextAlign align;
  final double fontSize;

  const SubHeading({
    super.key, 
    required this.text,
    this.color = Colors.black87,
    this.align = TextAlign.left,
    this.fontSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:GoogleFonts.montserrat(
        fontSize: 16,
        color: color,
        fontWeight: FontWeight.w400,
      ),  
      textAlign: align,
      maxLines: 3,
    );
  }

}

class RegularText extends StatelessWidget {

  final String text;
  final Color color;
  final TextAlign align;

  const RegularText({
    super.key, 
    required this.text,
    this.color = Colors.black87,
    this.align = TextAlign.left,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.montserrat(
        fontSize: 13,
        color: color,
        fontWeight: FontWeight.normal,
      ),
      textAlign: align,
      maxLines: 3,
    );
  }

}