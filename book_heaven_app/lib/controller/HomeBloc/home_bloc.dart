import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:book_heaven_app/controller/Data/item.dart';
import 'package:book_heaven_app/controller/HomeBloc/home_event.dart';
import 'package:book_heaven_app/controller/HomeBloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);

    on<HomeAddToCartButtonClickedEvent>(homeAddToCartButtonClickedEvent);

    on<HomeBookDetailsClickedEvent>(homeBookDetailsClickedEvent);
    on<IncrementProductCountEvent>(incrementProductCountEvent);
    on<DecrementProductCountEvent>(decrementProductCountEvent);
    on<ToggleFavoriteEvent>(toggleFavoriteEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) {
    emit(HomeLoadingState());

    emit(HomeLoadedSuccessState(
        bookList: bookList, vendorsList: vendorsList, authorList: authorList));
  }

  FutureOr<void> homeBookDetailsClickedEvent(
      HomeBookDetailsClickedEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToBookDetailsActionState(book: event.clickedBook));
  }

  FutureOr<void> toggleFavoriteEvent(
      ToggleFavoriteEvent event, Emitter<HomeState> emit) {
    event.book.isFev = !event.book.isFev;
    emit(BookUpdatedState(book: event.book));
  }

  FutureOr<void> incrementProductCountEvent(
      IncrementProductCountEvent event, Emitter<HomeState> emit) {
    log("Incrementing product count for ${event.book.bookName}");

    event.book.quantity += 1;
    emit(BookUpdatedState(book: event.book));
  }

  FutureOr<void> decrementProductCountEvent(
      DecrementProductCountEvent event, Emitter<HomeState> emit) {
    log("Decrementing product count for ${event.book.bookName}");

    if (event.book.quantity > 1) {
      // Update the product's `quantity`
      event.book.quantity -= 1;

      // Emit a state to refresh the cart view
      emit(BookUpdatedState(book: event.book));
    } else {
      log("Cannot decrement below 1");
    }
  }

  FutureOr<void> homeAddToCartButtonClickedEvent(
      HomeAddToCartButtonClickedEvent event, Emitter<HomeState> emit) {
    log("${event.clickedBook.bookName} added in bag");
    if (cartList.contains(event.clickedBook)) {
      emit(HomeBookItemCartedActionState(
          message: "${event.clickedBook.bookName} already added in bag"));
    } else {
      cartList.add(event.clickedBook);
      emit(HomeBookItemCartedActionState(
          message: "${event.clickedBook.bookName} added in bag"));
    }
  }
}
