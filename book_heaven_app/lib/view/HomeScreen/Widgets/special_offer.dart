import 'package:book_heaven_app/view/Widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SpecialOffer extends StatelessWidget {
  const SpecialOffer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(
        left: 23,
      ),
      margin: const EdgeInsets.only(
        right: 24,
        top: 15,
      ),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(250, 249, 253, 1),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Special Offer",
                style: GoogleFonts.roboto(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: const Color.fromRGBO(18, 18, 18, 1),
                ),
              ),
              Text(
                "Discount 25%",
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(18, 18, 18, 1),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                width: 100,
                child: CustomButton(title: "Order now"),
              )
            ],
          ),
          const Spacer(),
          Image.asset("assets/images/special.png")
        ],
      ),
    );
  }
}
