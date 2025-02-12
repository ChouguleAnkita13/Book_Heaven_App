import 'package:book_heaven_app/controller/HomeBloc/home_bloc.dart';
import 'package:book_heaven_app/controller/HomeBloc/home_event.dart';
import 'package:book_heaven_app/controller/HomeBloc/home_state.dart';
import 'package:book_heaven_app/model/book_model.dart';
import 'package:book_heaven_app/view/Widgets/custom_button.dart';
import 'package:book_heaven_app/view/Widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class BookDetail extends StatelessWidget {
  const BookDetail({super.key, required this.book});
  final Book book;

  @override
  Widget build(BuildContext context) {
    final HomeBloc homeBloc = HomeBloc();

    return BlocConsumer<HomeBloc, HomeState>(
        bloc: homeBloc,
        listenWhen: (previous, current) => current is HomeActionState,
        buildWhen: (previous, current) => current is! HomeActionState,
        listener: (context, state) {
          if (state is HomeBookItemCartedActionState) {
            CustomSnackbar.customSnackbar(context, state.message);
            Navigator.of(context).pop();
          }
        },
        builder: (context, state) {
          Book updatedBook = (state is BookUpdatedState) ? state.book : book;
          return SizedBox(
            height: MediaQuery.of(context).size.height - 20,
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: SizedBox(
                        width: 70,
                        child: Divider(
                          color: Color.fromRGBO(232, 232, 232, 1),
                          thickness: 4,
                        )),
                  ),
                  Center(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          updatedBook.bookImage,
                          height: 320,
                          width: 250,
                          fit: BoxFit.cover,
                        )),
                  ),
                  Row(
                    children: [
                      Text(
                        book.bookName,
                        style: GoogleFonts.roboto(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromRGBO(18, 18, 18, 1),
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            homeBloc
                                .add(ToggleFavoriteEvent(book: updatedBook));
                          },
                          icon: Icon(
                            updatedBook.isFev
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: const Color.fromRGBO(74, 138, 196, 1),
                            size: 30,
                          )),
                    ],
                  ),
                  Image.asset(
                    book.vendor,
                    height: 30,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    book.description,
                    style: GoogleFonts.roboto(
                        fontSize: 14,
                        color: const Color.fromRGBO(166, 166, 166, 1),
                        fontWeight: FontWeight.w400),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Review",
                        style: GoogleFonts.roboto(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromRGBO(18, 18, 18, 1),
                        ),
                      ),
                      Image.asset(
                        "assets/images/reviews.png",
                      )
                      // const RatingWidget(isMutable: true),
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          homeBloc.add(
                              DecrementProductCountEvent(book: updatedBook));
                        },
                        child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: (updatedBook.quantity == 1)
                                  ? const Color.fromRGBO(166, 166, 166, 1)
                                  : const Color.fromRGBO(74, 138, 196, 1),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.remove,
                                color: (updatedBook.quantity == 1)
                                    ? const Color.fromRGBO(74, 138, 196, 1)
                                    : Colors.white,
                                size: 26,
                              ),
                            )),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        updatedBook.quantity.toString(),
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(18, 18, 18, 1),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          homeBloc.add(
                              IncrementProductCountEvent(book: updatedBook));
                        },
                        child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: const Color.fromRGBO(74, 138, 196, 1),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 26,
                              ),
                            )),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      // Price
                      Text(
                        "\$${book.bookPrice * updatedBook.quantity}",
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(74, 138, 196, 1),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          homeBloc.add(HomeAddToCartButtonClickedEvent(
                              clickedBook: updatedBook));
                        },
                        child: const SizedBox(
                          width: 160,
                          child: CustomButton(title: "Add to Bag"),
                        ),
                      ),
                      const SizedBox(
                        width: 140,
                        child: CustomButton(
                          title: "Buy Now",
                          backgroundColor: Colors.white,
                          textColor: Color.fromRGBO(74, 138, 196, 1),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
