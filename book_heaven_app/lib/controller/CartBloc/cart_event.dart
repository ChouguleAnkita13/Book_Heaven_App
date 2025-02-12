import 'package:book_heaven_app/model/book_model.dart';

abstract class CartEvent {}

class CartInitialEvent extends CartEvent {}

class CartRemoveBookFromCartEvent extends CartEvent {
  final Book book;
  CartRemoveBookFromCartEvent({required this.book});
}

class IncrementProductCountEvent extends CartEvent {
  final Book book;

  IncrementProductCountEvent({required this.book});
}

class DecrementProductCountEvent extends CartEvent {
  final Book book;

  DecrementProductCountEvent({required this.book});
}
