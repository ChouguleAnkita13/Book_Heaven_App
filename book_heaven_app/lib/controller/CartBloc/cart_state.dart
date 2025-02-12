import 'package:book_heaven_app/model/book_model.dart';

abstract class CartState {}

class CartActionState extends CartState {}

class CartInitialState extends CartState {}

class CartLoadingState extends CartState {}

class CartLoadedSuccessState extends CartState {
  final List<Book> cartList;
  CartLoadedSuccessState({
    required this.cartList,
  });
}

class CartRemoveProductFromCartActionState extends CartActionState {
  final String message;

  CartRemoveProductFromCartActionState({required this.message});
}
