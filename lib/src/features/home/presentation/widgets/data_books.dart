import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:third_exam/src/core/theme/app_colors.dart';
import 'package:third_exam/src/features/home/presentation/models/appbar_info_about_books.dart';

class DataBooks extends StatefulWidget {
  const DataBooks({super.key});

  @override
  State<DataBooks> createState() => _DataBooksState();
}

class _DataBooksState extends State<DataBooks> {
  int selectedValue = 0;
  List<AppbarInfoAboutBooks> dataBook = [
    AppbarInfoAboutBooks(
      body: 'And when it was time to go, the time was no\nmore in control...',
      backgroundcolor: true,
    ),
    AppbarInfoAboutBooks(
      body: 'life is like a time machine, it takes\nyou to future',
      backgroundcolor: false,
    ),
    AppbarInfoAboutBooks(
      body: 'Creativity is the life of the\ncreative minds',
      backgroundcolor: false,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: ListView.separated(
        scrollDirection: .horizontal,
        itemBuilder: (context, index) {
          final books = dataBook[index];
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedValue = index;
              });
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 220),
              width: 150,
              padding: .only(top: 8, right: 8, left: 8),
              decoration: BoxDecoration(
                borderRadius: .circular(10),
                gradient: books.backgroundcolor
                    ? LinearGradient(
                        colors: [AppColors.grey4, AppColors.grey4],
                        begin: .bottomLeft,
                        end: .topRight,
                      )
                    : LinearGradient(
                        colors: [
                          AppColors.containerGradient,
                          AppColors.grey3,
                        ],
                        begin: .bottomLeft,
                        end: .topRight,
                      ),
              ),
              child: Column(
                children: [
                  Row(children: [Image.asset('assets/images/up.png')]),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.only(left: 13, right: 13),
                    child: Text(
                      books.body,
                      style: GoogleFonts.poppins(
                        color: books.backgroundcolor
                            ? AppColors.grey2
                            : AppColors.grey1,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Spacer(),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Container(
                        height: 54,
                        width: 37,
                        decoration: BoxDecoration(color: AppColors.accentGreen),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 28),
                        child: Image.asset('assets/images/down.png'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 8);
        },
        itemCount: dataBook.length,
      ),
    );
  }
}
