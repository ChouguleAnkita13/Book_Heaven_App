// part of 'home_bloc.dart';

// @immutable

import 'package:book_heaven_app/model/author_model.dart';
import 'package:book_heaven_app/model/book_model.dart';

abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
  final List<Book> bookList;
  final List vendorsList;
  final List<Author> authorList;
  HomeLoadedSuccessState({
    required this.bookList,
    required this.vendorsList,
    required this.authorList,
  });
}

class HomeNavigateToBookDetailsActionState extends HomeActionState {
  final Book book;
  HomeNavigateToBookDetailsActionState({
    required this.book,
  });
}

class BookUpdatedState extends HomeState {
  final Book book;
  BookUpdatedState({required this.book});
}

class HomeBookItemCartedActionState extends HomeActionState {
  final String message;

  HomeBookItemCartedActionState({required this.message});
}
