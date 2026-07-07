import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:third_exam/src/core/routes/pages.dart';
import 'package:third_exam/src/core/theme/app_colors.dart';
import 'package:third_exam/src/features/home/presentation/models/book_options.dart';
import 'package:third_exam/src/features/home/presentation/models/books_story.dart';
import 'package:third_exam/src/features/home/presentation/widgets/trending_books.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  List<BookOptions> options = [
    BookOptions(image: 'assets/images/fire.png', title: 'Trending'),
    BookOptions(image: 'assets/images/book.png', title: '5-Minutes Read'),
    BookOptions(image: 'assets/images/book.png', title: '5-Minutes Read'),
    BookOptions(image: 'assets/images/book.png', title: '5-Minutes Read'),
    BookOptions(image: 'assets/images/book.png', title: '5-Minutes Read'),
  ];
  final List<BooksStory> books = [
    BooksStory(title: 'Royryan Merc...', isAvtive: true),
    BooksStory(title: 'Neil Gaiman', isAvtive: true),
    BooksStory(title: 'Mark mcallister', isAvtive: true),
    BooksStory(title: 'Michael Doug...', isAvtive: false),
    BooksStory(title: 'Royryan Merc...', isAvtive: false),
    BooksStory(title: 'Royryan Merc...', isAvtive: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: .all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Image.asset('assets/images/text.png'),
                  InkWell(
                    onTap: () {
                      context.push('${Pages.home}/${Pages.account}');
                    },
                    borderRadius: .circular(100),
                    child: CircleAvatar(
                      radius: 24,
                      backgroundColor: AppColors.accentGreen,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              SizedBox(
                height: 116,
                child: ListView.separated(
                  scrollDirection: .horizontal,
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    // ignore: unused_local_variable
                    final book = books[index];
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(100),
                          child: CircleAvatar(
                            radius: 43,
                            backgroundColor: book.isAvtive
                                ? AppColors.accentGreen
                                : AppColors.grey4,
                            child: CircleAvatar(
                              radius: 41,
                              backgroundColor: AppColors.black,
                              child: CircleAvatar(
                                radius: 37,
                                backgroundColor: AppColors.grey1,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          book.title,
                          style: GoogleFonts.poppins(
                            color: AppColors.grey2,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 12);
                  },
                ),
              ),
              SizedBox(height: 32),
              SizedBox(
                height: 43,
                child: ListView.separated(
                  scrollDirection: .horizontal,
                  itemBuilder: (context, index) {
                    final option = options[index];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 220),
                        padding: EdgeInsets.only(left: 15, right: 15),
                        height: 42,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: selectedIndex == index
                                ? AppColors.accentGreen
                                : AppColors.grey4,
                          ),
                          borderRadius: BorderRadius.circular(100),
                          color: selectedIndex == index
                              ? AppColors.accentGreen
                              : AppColors.black,
                        ),
                        child: Center(
                          child: Row(
                            children: [
                              Image.asset(
                                option.image,
                                color: selectedIndex == index
                                    ? AppColors.grey4
                                    : AppColors.white,
                              ),
                              SizedBox(width: 5),
                              Text(
                                option.title,
                                style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  color: selectedIndex == index
                                      ? AppColors.grey4
                                      : AppColors.grey1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 4);
                  },
                  itemCount: options.length,
                ),
              ),
              SizedBox(height: 32),
              Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/news.png'),
                    fit: .cover,
                  ),
                  borderRadius: .circular(10),
                ),
              ),
              SizedBox(height: 32),
              TrendingBooks(title: 'Trending'),
              SizedBox(height: 24),
              TrendingBooks2(title: 'Trending'),
              SizedBox(height: 24),
              TrendingBooks(title: '5-Minutes read'),
            ],
          ),
        ),
      ),
    );
  }
}
