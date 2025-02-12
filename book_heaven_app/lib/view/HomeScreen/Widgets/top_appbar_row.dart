import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopAppbarRow extends StatelessWidget {
  const TopAppbarRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset("assets/icons/Search.png"),
          Text(
            "Home",
            style: GoogleFonts.roboto(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: const Color.fromRGBO(18, 18, 18, 1),
            ),
          ),
          Image.asset("assets/icons/notification.png"),
        ],
      ),
    );
  }
}
