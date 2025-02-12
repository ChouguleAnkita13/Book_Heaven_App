import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomToprow extends StatelessWidget {
  const CustomToprow({super.key, required this.title, required this.content});
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24, bottom: 10, top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.roboto(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: const Color.fromRGBO(18, 18, 18, 1),
            ),
          ),
          Text(
            content,
            style: GoogleFonts.roboto(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: const Color.fromRGBO(74, 138, 196, 1),
            ),
          ),
        ],
      ),
    );
  }
}
