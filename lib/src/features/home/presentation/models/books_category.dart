class BooksCategory {
  final String? image;
  bool isItalic;
  final String title;
  final String body;
  final String listenTime;
  final String readingTime;

  BooksCategory({
    this.image = '',
    required this.title,
    required this.body,
    required this.listenTime,
    required this.readingTime,
    this.isItalic = false,
  });
}
