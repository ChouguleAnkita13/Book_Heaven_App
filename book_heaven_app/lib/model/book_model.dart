class Book {
  final String bookImage;
  final String bookName;
  final double bookPrice;
  int quantity = 1;
  bool isFev = false;
  final String description;
  final String vendor;

  Book(
      {required this.bookImage,
      required this.bookName,
      required this.isFev,
      required this.bookPrice,
      required this.quantity,
      required this.description,
      required this.vendor});
}
