import 'package:book_heaven_app/model/author_model.dart';
import 'package:book_heaven_app/model/book_model.dart';

///ADD TO CART LIST
List<Book> cartList = [];

///Vendors List
List vendorsList = [
  "assets/images/group1.png",
  "assets/images/group2.png",
  "assets/images/group3.png",
  "assets/images/group4.png",
];

///BOOKS LIST
List<Book> bookList = [
  Book(
      bookImage: "assets/images/kite1.png",
      bookName: "The Kite Runner",
      bookPrice: 14.99,
      quantity: 1,
      isFev: false,
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Viverra dignissim ac ac ac. Nibh et sed ac, eget malesuada.",
      vendor: "assets/images/group3.png"),
  Book(
      bookImage: "assets/images/kite2.png",
      bookName: "Carrie Fisher",
      bookPrice: 20.99,
      quantity: 1,
      isFev: false,
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Viverra dignissim ac ac ac. Nibh et sed ac, eget malesuada.",
      vendor: "assets/images/group2.png"),
  Book(
      bookImage: "assets/images/kite3.png",
      bookName: "Bright Young",
      bookPrice: 15.99,
      quantity: 1,
      isFev: false,
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Viverra dignissim ac ac ac. Nibh et sed ac, eget malesuada.",
      vendor: "assets/images/group1.png")
];

///Author List
///
List<Author> authorList = [
  const Author(
      authorImage: "assets/images/john.png",
      authorName: "John Freeman",
      authorType: "Writer"),
  const Author(
      authorImage: "assets/images/tess.png",
      authorName: "Tess Gunty",
      authorType: "Novelist"),
  const Author(
      authorImage: "assets/images/richard.png",
      authorName: "Richard Perston",
      authorType: "Writer"),
  const Author(
      authorImage: "assets/images/john.png",
      authorName: "John Freeman",
      authorType: "Writer"),
  const Author(
      authorImage: "assets/images/tess.png",
      authorName: "Tess Gunty",
      authorType: "Novelist"),
  const Author(
      authorImage: "assets/images/richard.png",
      authorName: "Richard Perston",
      authorType: "Writer"),
];
