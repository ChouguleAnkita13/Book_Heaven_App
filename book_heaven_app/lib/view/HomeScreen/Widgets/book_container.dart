import 'package:book_heaven_app/model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookContainer extends StatelessWidget {
  const BookContainer({super.key, required this.book});
  final Book book;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              book.bookImage,
              width: 127,
              height: 180,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            book.bookName,
            style: GoogleFonts.roboto(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: const Color.fromRGBO(18, 18, 18, 1),
            ),
          ),
          Text(
            "\$${book.bookPrice}",
            style: GoogleFonts.roboto(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: const Color.fromRGBO(74, 138, 196, 1),
            ),
          ),
        ],
      ),
    );
  }
}
