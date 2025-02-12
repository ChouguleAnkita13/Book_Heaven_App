import 'package:book_heaven_app/model/book_model.dart';

abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeAddToCartButtonClickedEvent extends HomeEvent {
  final Book clickedBook;
  HomeAddToCartButtonClickedEvent({
    required this.clickedBook,
  });
}

class IncrementProductCountEvent extends HomeEvent {
  final Book book;

  IncrementProductCountEvent({required this.book});
}

class DecrementProductCountEvent extends HomeEvent {
  final Book book;

  DecrementProductCountEvent({required this.book});
}

class ToggleFavoriteEvent extends HomeEvent {
  final Book book;
  ToggleFavoriteEvent({required this.book});
}

class HomeBookDetailsClickedEvent extends HomeEvent {
  final Book clickedBook;
  HomeBookDetailsClickedEvent({
    required this.clickedBook,
  });
}
