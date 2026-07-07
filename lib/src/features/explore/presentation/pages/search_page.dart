import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:third_exam/src/core/theme/app_colors.dart';
import 'package:third_exam/src/features/explore/presentation/models/search_book_model.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<SearchBookModel> searchbook = [
    SearchBookModel(
      title: 'The good guy',
      body: 'Mark mcallister',
      listeningTime: '5m',
      readingTime: '8m',
    ),
    SearchBookModel(
      title: 'The good guy',
      body: 'Mark mcallister',
      listeningTime: '5m',
      readingTime: '8m',
    ),
    SearchBookModel(
      title: 'The good guy',
      body: 'Mark mcallister',
      listeningTime: '5m',
      readingTime: '8m',
    ),
    SearchBookModel(
      title: 'The good guy',
      body: 'Mark mcallister',
      listeningTime: '5m',
      readingTime: '8m',
    ),
    SearchBookModel(
      title: 'The good guy',
      body: 'Mark mcallister',
      listeningTime: '5m',
      readingTime: '8m',
    ),
    SearchBookModel(
      title: 'The good guy',
      body: 'Mark mcallister',
      listeningTime: '5m',
      readingTime: '8m',
    ),
    SearchBookModel(
      title: 'The good guy',
      body: 'Mark mcallister',
      listeningTime: '5m',
      readingTime: '8m',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: .all(16),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              TextField(
                cursorColor: AppColors.white,
                autofocus: true,
                controller: TextEditingController(),
                style: GoogleFonts.poppins(
                  color: AppColors.grey1,
                  fontSize: 13,
                ),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: .circular(10),
                    borderSide: BorderSide(color: AppColors.grey2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: .circular(10),
                    borderSide: BorderSide(color: AppColors.accentGreen),
                  ),
                  filled: true,
                  fillColor: AppColors.grey4,
                  prefixIcon: Padding(
                    padding: .only(left: 5),
                    child: IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      icon: Icon(
                        Icons.keyboard_arrow_left,
                        size: 25,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    'Recent searches',
                    style: GoogleFonts.poppins(
                      color: AppColors.white,
                      fontWeight: .bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'Clear recent searches',
                    style: GoogleFonts.poppins(
                      color: AppColors.grey2,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              SizedBox(
                height: 650,
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    final findbooks = searchbook[index];
                    return Row(
                      children: [
                        Container(
                          height: 77,
                          width: 53,
                          decoration: BoxDecoration(
                            color: AppColors.accentGreen,
                          ),
                        ),
                        SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: .start,
                          children: [
                            Text(
                              findbooks.title,
                              style: GoogleFonts.poppins(
                                color: AppColors.white,
                              ),
                            ),
                            Text(
                              findbooks.body,
                              style: GoogleFonts.poppins(
                                color: AppColors.grey1,
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
                                  findbooks.listeningTime,
                                  style: GoogleFonts.poppins(
                                    color: AppColors.grey1,
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(width: 16),
                                Image.asset('assets/images/read.png'),
                                SizedBox(width: 5),
                                Text(
                                  findbooks.readingTime,
                                  style: GoogleFonts.poppins(
                                    color: AppColors.grey1,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.close, color: AppColors.grey3),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 16);
                  },
                  itemCount: searchbook.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
