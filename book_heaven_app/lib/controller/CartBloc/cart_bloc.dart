import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:book_heaven_app/controller/CartBloc/cart_event.dart';
import 'package:book_heaven_app/controller/CartBloc/cart_state.dart';
import 'package:book_heaven_app/controller/Data/item.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitialState()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveBookFromCartEvent>(cartRemoveBookFromCartEvent);
    on<IncrementProductCountEvent>(incrementProductCountEvent);
    on<DecrementProductCountEvent>(decrementProductCountEvent);
  }
  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) async {
    log('Emit CartLoadingState');

    emit(CartLoadingState());
    log('pause');

    log('Emit CartLoadedSuccessState');

    emit(CartLoadedSuccessState(cartList: cartList));
  }

  FutureOr<void> cartRemoveBookFromCartEvent(
      CartRemoveBookFromCartEvent event, Emitter<CartState> emit) async {
    log('Remove Product from cart');
    cartList.remove(event.book);

    ///To show List after removing items from cart
    emit(CartLoadedSuccessState(cartList: cartList));

    emit(CartRemoveProductFromCartActionState(
        message: "${event.book.bookName} removed from Cart"));
  }

  FutureOr<void> incrementProductCountEvent(
      IncrementProductCountEvent event, Emitter<CartState> emit) {
    log("Incrementing product count for ${event.book.bookName}");

    // Update the product's `numberOfItems`
    event.book.quantity += 1;

    // Emit a state to refresh the cart view
    emit(CartLoadedSuccessState(cartList: cartList));
  }

  FutureOr<void> decrementProductCountEvent(
      DecrementProductCountEvent event, Emitter<CartState> emit) {
    log("Decrementing product count for ${event.book.bookName}");

    if (event.book.quantity > 1) {
      // Update the product's `numberOfItems`
      event.book.quantity -= 1;

      // Emit a state to refresh the cart view
      emit(CartLoadedSuccessState(cartList: cartList));
    } else {
      log("Cannot decrement below 1");
    }
  }
}
