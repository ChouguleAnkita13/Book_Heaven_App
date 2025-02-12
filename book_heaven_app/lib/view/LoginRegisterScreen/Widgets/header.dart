import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.title, required this.content});
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            size: 24,
            color: const Color.fromRGBO(18, 18, 18, 1),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          title,
          style: GoogleFonts.roboto(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: const Color.fromRGBO(18, 18, 18, 1),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          content,
          style: GoogleFonts.roboto(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: const Color.fromRGBO(166, 166, 166, 1),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
