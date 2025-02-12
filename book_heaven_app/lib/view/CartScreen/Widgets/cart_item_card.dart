import 'package:book_heaven_app/controller/CartBloc/cart_bloc.dart';
import 'package:book_heaven_app/controller/CartBloc/cart_event.dart';
import 'package:book_heaven_app/model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({super.key, required this.cartBloc, required this.book});
  final CartBloc cartBloc;
  final Book book;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  book.bookImage,
                  fit: BoxFit.cover,
                  height: 60,
                  width: 60,
                )),
            const SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.bookName,
                  style: GoogleFonts.roboto(
                      color: const Color.fromRGBO(18, 18, 18, 1),
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 120,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(229, 243, 255, 1),
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          cartBloc.add(DecrementProductCountEvent(book: book));
                        },
                        child: Container(
                            width: 25,
                            height: 25,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(74, 138, 196, 1),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child:
                                const Icon(Icons.remove, color: Colors.white)),
                      ),
                      Text(
                        book.quantity.toString(),
                        style: GoogleFonts.roboto(
                            color: const Color.fromRGBO(18, 18, 18, 1),
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      GestureDetector(
                        onTap: () {
                          cartBloc.add(IncrementProductCountEvent(book: book));
                        },
                        child: Container(
                            width: 25,
                            height: 25,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(74, 138, 196, 1),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: const Icon(Icons.add, color: Colors.white)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${book.bookPrice * book.quantity}",
                  style: GoogleFonts.roboto(
                      fontSize: 16,
                      color: const Color.fromRGBO(74, 138, 196, 1),
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 25,
                ),
                GestureDetector(
                    onTap: () {
                      cartBloc.add(CartRemoveBookFromCartEvent(book: book));
                    },
                    child: Text(
                      "Remove",
                      style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.redAccent),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
