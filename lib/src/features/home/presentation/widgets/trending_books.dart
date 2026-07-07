import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:third_exam/src/core/routes/pages.dart';
import 'package:third_exam/src/core/theme/app_colors.dart';
import 'package:third_exam/src/features/home/presentation/models/books_category.dart';

class TrendingBooks extends StatefulWidget {
  final String title;
  const TrendingBooks({super.key, required this.title});

  @override
  State<TrendingBooks> createState() => _TrendingBooksState();
}

class _TrendingBooksState extends State<TrendingBooks> {
  List<BooksCategory> categories = [
    BooksCategory(
      title: 'The good guy',
      body: 'Mark mcallister',
      listenTime: '5m',
      readingTime: '8m',
      isItalic: true,
    ),
    BooksCategory(
      title: 'Futurama',
      body: 'Michael Douglas jr.',
      listenTime: '12m',
      readingTime: '9m',
    ),
    BooksCategory(
      title: 'Explore your create',
      body: 'Royryan Mercado',
      listenTime: '15m',
      readingTime: '15m',
    ),
    BooksCategory(
      title: 'The good guy',
      body: 'Mark mcallister',
      listenTime: '15m',
      readingTime: '15m',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Text(
              widget.title,
              style: GoogleFonts.poppins(
                color: AppColors.white,
                fontSize: 22,
                fontWeight: .bold,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Row(
                mainAxisSize: .min,
                children: [
                  Text(
                    'Show all',
                    style: GoogleFonts.poppins(color: AppColors.accentGreen),
                  ),
                  SizedBox(width: 5),
                  CircleAvatar(
                    radius: 8,
                    backgroundColor: AppColors.accentGreen,
                    child: Center(
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: AppColors.black,
                        fontWeight: .bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        SizedBox(
          height: 309,
          child: ListView.separated(
            scrollDirection: .horizontal,
            itemBuilder: (context, index) {
              final category = categories[index];
              return InkWell(
                onTap: () {
                  context.push('${Pages.home}/${Pages.detail}');
                },
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Container(
                      height: 205,
                      width: 145,
                      decoration: BoxDecoration(color: AppColors.accentGreen),
                    ),
                    SizedBox(height: 8),
                    Text(
                      category.title,
                      style: GoogleFonts.poppins(
                        color: AppColors.white,
                        fontStyle: category.isItalic ? .italic : .normal,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      category.body,
                      style: GoogleFonts.poppins(
                        color: AppColors.grey2,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: .start,
                      children: [
                        Image.asset('assets/images/headphone.png'),
                        SizedBox(width: 5),
                        Text(
                          category.listenTime,
                          style: GoogleFonts.poppins(
                            color: AppColors.grey2,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(width: 16),
                        Image.asset('assets/images/read.png'),
                        SizedBox(width: 5),
                        Text(
                          category.readingTime,
                          style: GoogleFonts.poppins(
                            color: AppColors.grey2,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: 8);
            },
            itemCount: categories.length,
          ),
        ),
      ],
    );
  }
}

class TrendingBooks2 extends StatefulWidget {
  final String title;
  const TrendingBooks2({super.key, required this.title});

  @override
  State<TrendingBooks2> createState() => _TrendingBooks2State();
}

class _TrendingBooks2State extends State<TrendingBooks2> {
  List<BooksCategory> categories2 = [
    BooksCategory(
      title: 'Norse mythology',
      body: 'Neil Gaiman',
      listenTime: '5m',
      readingTime: '8m',
    ),
    BooksCategory(
      title: 'Explore your create...',
      body: 'Roynryan Mercado',
      listenTime: '5m',
      readingTime: '8m',
      isItalic: true,
    ),
    BooksCategory(
      title: 'Futurama',
      body: 'Michael Dougles jr.',
      listenTime: '5m',
      readingTime: '8m',
      isItalic: true,
    ),
    BooksCategory(
      title: 'The good guy',
      body: 'Mark mcallister',
      listenTime: '5m',
      readingTime: '8m',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Text(
              widget.title,
              style: GoogleFonts.poppins(
                color: AppColors.white,
                fontSize: 22,
                fontWeight: .bold,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Row(
                mainAxisSize: .min,
                children: [
                  Text(
                    'Show all',
                    style: GoogleFonts.poppins(color: AppColors.accentGreen),
                  ),
                  SizedBox(width: 5),
                  CircleAvatar(
                    radius: 8,
                    backgroundColor: AppColors.accentGreen,
                    child: Center(
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: AppColors.black,
                        fontWeight: .bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        SizedBox(
          height: 300,
          child: ListView.separated(
            scrollDirection: .horizontal,
            itemBuilder: (context, index) {
              final category = categories2[index];
              return Column(
                crossAxisAlignment: .start,
                children: [
                  Container(
                    height: 205,
                    width: 145,
                    decoration: BoxDecoration(color: AppColors.accentGreen),
                  ),
                  SizedBox(height: 8),
                  Text(
                    category.title,
                    style: GoogleFonts.poppins(
                      color: AppColors.white,
                      fontStyle: category.isItalic ? .italic : .normal,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    category.body,
                    style: GoogleFonts.poppins(
                      color: AppColors.grey2,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: .start,
                    children: [
                      Image.asset('assets/images/headphone.png'),
                      Text(
                        category.listenTime,
                        style: GoogleFonts.poppins(
                          color: AppColors.grey2,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(width: 16),
                      Image.asset('assets/images/read.png'),
                      SizedBox(width: 5),
                      Text(
                        category.readingTime,
                        style: GoogleFonts.poppins(
                          color: AppColors.grey2,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: 8);
            },
            itemCount: categories2.length,
          ),
        ),
      ],
    );
  }
}
