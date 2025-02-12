import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, required this.title, this.backgroundColor, this.textColor});
  final String title;
  final Color? backgroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 48,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: backgroundColor ?? const Color.fromRGBO(74, 138, 196, 1),
          borderRadius: BorderRadius.circular(48),
          border: Border.all(
              color: const Color.fromRGBO(74, 138, 196, 1), width: 2)),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: GoogleFonts.roboto(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: textColor ?? const Color.fromRGBO(255, 255, 255, 1),
        ),
      ),
    );
  }
}
