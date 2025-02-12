import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomLineButton extends StatelessWidget {
  const BottomLineButton(
      {super.key, required this.content, required this.title});
  final String content;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          content,
          style: GoogleFonts.roboto(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: const Color.fromRGBO(166, 166, 166, 1),
          ),
        ),
        Text(
          title,
          style: GoogleFonts.roboto(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: const Color.fromRGBO(74, 138, 196, 1),
          ),
        )
      ],
    );
  }
}
