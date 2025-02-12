import 'package:book_heaven_app/model/author_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthorContainer extends StatelessWidget {
  const AuthorContainer({super.key, required this.author});
  final Author author;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(
              author.authorImage,
              width: 90,
              height: 90,
            ),
          ),
          Text(
            author.authorName,
            style: GoogleFonts.roboto(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: const Color.fromRGBO(18, 18, 18, 1),
            ),
          ),
          Text(
            author.authorType,
            style: GoogleFonts.roboto(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: const Color.fromRGBO(166, 166, 166, 1),
            ),
          ),
        ],
      ),
    );
  }
}
