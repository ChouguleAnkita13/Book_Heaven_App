import 'dart:developer';

import 'package:book_heaven_app/controller/CartBloc/cart_bloc.dart';
import 'package:book_heaven_app/controller/CartBloc/cart_event.dart';
import 'package:book_heaven_app/controller/CartBloc/cart_state.dart';
import 'package:book_heaven_app/view/CartScreen/Widgets/cart_item_card.dart';
import 'package:book_heaven_app/view/CartScreen/Widgets/cart_summary.dart';
import 'package:book_heaven_app/view/Widgets/custom_button.dart';
import 'package:book_heaven_app/view/Widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  CartBloc cartBloc = CartBloc();

  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: BlocConsumer<CartBloc, CartState>(
          bloc: cartBloc,
          listenWhen: (previous, current) => current is CartActionState,
          buildWhen: (previous, current) => current is! CartActionState,
          listener: (context, state) {
            if (state is CartRemoveProductFromCartActionState) {
              log("------In Snackbar RemoveCartActionState");
              CustomSnackbar.customSnackbar(context, state.message);
            }
          },
          builder: (context, state) {
            switch (state.runtimeType) {
              case const (CartLoadingState):
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case const (CartLoadedSuccessState):
                final successState = state as CartLoadedSuccessState;
                // CALCULATE TOTAL ITEM COUNT AND PRICE

                double totalPrice = successState.cartList.fold(
                    0.0, (sum, item) => sum + (item.bookPrice * item.quantity));
                return SingleChildScrollView(
                  child: SizedBox(
                    height: MediaQuery.sizeOf(context).height - 50,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 50, bottom: 15, left: 15, right: 15),
                      child: Column(
                        children: [
                          Center(
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 20),
                              child: Text(
                                "My Bag",
                                style: GoogleFonts.roboto(
                                    color: const Color.fromRGBO(18, 18, 18, 1),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                          successState.cartList.isNotEmpty
                              ? SizedBox(
                                  height: 360,
                                  child: ListView.separated(
                                    itemCount: successState.cartList.length,
                                    separatorBuilder: (context, index) {
                                      return const Divider(
                                        color: Color.fromRGBO(232, 232, 232, 1),
                                      );
                                    },
                                    itemBuilder: (context, index) {
                                      return CartItemCard(
                                        book: successState.cartList[index],
                                        cartBloc: cartBloc,
                                      );
                                    },
                                  ),
                                )
                              : Center(
                                  child: Text(
                                    "NO Books added in bag",
                                    style: GoogleFonts.roboto(
                                        color:
                                            const Color.fromRGBO(18, 18, 18, 1),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                          const Divider(
                            color: Color.fromRGBO(232, 232, 232, 1),
                          ),
                          const Spacer(),
                          CartSummary(
                            totalPrice: totalPrice,
                            cartItems: successState.cartList,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const CustomButton(
                            title: "Pay Now",
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              default:
                return const SizedBox();
            }
          }),
    );
  }
}
