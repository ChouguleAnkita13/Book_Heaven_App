import 'package:book_heaven_app/model/book_model.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartSummary extends StatelessWidget {
  final double totalPrice;
  final List<Book> cartItems;

  const CartSummary(
      {super.key, required this.totalPrice, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
      child: Column(
        children: [
          SizedBox(
            height: 100,
            child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  Book book = cartItems[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          book.bookName,
                          style: GoogleFonts.roboto(
                              color: const Color.fromRGBO(18, 18, 18, 1),
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                        const Spacer(),
                        Text(
                          "\$${book.bookPrice}",
                          style: GoogleFonts.roboto(
                              color: const Color.fromRGBO(18, 18, 18, 1),
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  );
                }),
          ),
          const Divider(
            color: Color.fromRGBO(232, 232, 232, 1),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Subtotal",
                style: GoogleFonts.roboto(
                    color: const Color.fromRGBO(18, 18, 18, 1),
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                "\$${totalPrice.toStringAsFixed(2)}",
                style: GoogleFonts.roboto(
                    color: const Color.fromRGBO(18, 18, 18, 1),
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const SizedBox(height: 5),
          const Divider(
            color: Colors.grey,
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Shipping",
                style: GoogleFonts.roboto(
                    color: const Color.fromRGBO(18, 18, 18, 1),
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                totalPrice != 0 ? "\$2.00" : "\$0.00",
                style: GoogleFonts.roboto(
                    color: const Color.fromRGBO(18, 18, 18, 1),
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
          const SizedBox(height: 5),
          const Divider(
            color: Colors.grey,
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total Payment",
                style: GoogleFonts.roboto(
                    color: const Color.fromRGBO(18, 18, 18, 1),
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                (totalPrice != 0)
                    ? "\$${(totalPrice + 2).toStringAsFixed(2)}"
                    : "\$0.00",
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: const Color.fromRGBO(74, 138, 196, 1),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
