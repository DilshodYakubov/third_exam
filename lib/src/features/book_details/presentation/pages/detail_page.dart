import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:third_exam/src/core/theme/app_colors.dart';
import 'package:third_exam/src/features/book_details/presentation/widgets/box_nexus.dart';
import 'package:third_exam/src/features/book_details/presentation/widgets/category_of_theme_book.dart';
import 'package:third_exam/src/features/home/presentation/widgets/trending_books.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool onPressed = false;

  List<String> topics = [
    'Personal growth',
    'Culture & Society',
    'Fiction',
    'Mind & Philosophy',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: .start,
          children: [
            //------------------------------------------BackgroundImage_Futurama
            Container(
              height: 430,
              padding: .only(left: 16, right: 16),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/futurama_back.png'),
                  fit: .fitWidth,
                ),
              ),
              child: Stack(
                alignment: .bottomCenter,
                children: [
                  Row(
                    mainAxisAlignment: .center,
                    children: [Image.asset('assets/images/futurama_book.png')],
                  ),
                  Positioned(
                    top: 380,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child:
                        BoxNexus(), //-------------------------------BookNexus_1
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text(
                        'Project Management for the\nUnofficial Proect Manager',
                        style: GoogleFonts.poppins(
                          color: AppColors.white,
                          fontSize: 24,
                          fontWeight: .bold,
                        ),
                      ),
                      Image.asset(
                        'assets/images/library_icon.png',
                        color: AppColors.white,
                        height: 20,
                        width: 20,
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Kory Kogon, Suzette Blakemore, and James wood',
                    style: GoogleFonts.poppins(color: AppColors.white),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'A FanklinConvey Title',
                    style: GoogleFonts.poppins(color: AppColors.grey2),
                  ),
                  SizedBox(height: 24),
                  BoxNexus2(), //------------------------------------BoxNexus_2
                  SizedBox(height: 32),
                  Text(
                    'About this Book',
                    style: GoogleFonts.poppins(
                      color: AppColors.white,
                      fontWeight: .bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Getting Along (2022) describes the importance of workplace interactions and their effecs on productivity and creaiviy.',
                    style: GoogleFonts.poppins(color: AppColors.grey1),
                  ),
                  SizedBox(height: 16),
                  CategoryOfThemeBook(), //--------------Category_of_theme_book
                  SizedBox(height: 32),
                  Text(
                    '56 Chapters',
                    style: GoogleFonts.poppins(
                      color: AppColors.white,
                      fontWeight: .bold,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 24),
                  Row(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        '01',
                        style: GoogleFonts.poppins(
                          color: AppColors.white,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: .start,
                        children: [
                          Text(
                            'Introduction',
                            style: GoogleFonts.poppins(
                              color: AppColors.white,
                              fontSize: 18,
                              fontWeight: .bold,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Subscribe to unclock all 2 key ideas fro..',
                            style: GoogleFonts.poppins(color: AppColors.grey1),
                          ),
                        ],
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          setState(() {
                            onPressed = !onPressed;
                          });
                        },
                        borderRadius: .circular(100),
                        child: Container(
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(
                            borderRadius: .circular(100),
                            color: AppColors.accentGreen,
                          ),
                          child: Center(
                            child: onPressed
                                ? Image.asset('assets/images/pause.png')
                                : Image.asset('assets/images/play.png'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Row(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        '02',
                        style: GoogleFonts.poppins(
                          color: AppColors.white,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: .start,
                        children: [
                          Text(
                            'Creating the',
                            style: GoogleFonts.poppins(
                              color: AppColors.white,
                              fontSize: 18,
                              fontWeight: .bold,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Subscribe to unclock all 2 key ideas fro..',
                            style: GoogleFonts.poppins(color: AppColors.grey1),
                          ),
                        ],
                      ),
                      Spacer(),
                      Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                          borderRadius: .circular(100),
                          color: AppColors.bgDark,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.lock_outline,
                            color: AppColors.grey1,
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Row(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        '03',
                        style: GoogleFonts.poppins(
                          color: AppColors.white,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: .start,
                        children: [
                          Text(
                            'Introduction',
                            style: GoogleFonts.poppins(
                              color: AppColors.white,
                              fontSize: 18,
                              fontWeight: .bold,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Subscribe to unclock all 2 key ideas fro..',
                            style: GoogleFonts.poppins(color: AppColors.grey1),
                          ),
                        ],
                      ),
                      Spacer(),
                      Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                          borderRadius: .circular(100),
                          color: AppColors.bgDark,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.lock_outline,
                            color: AppColors.grey1,
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Padding(padding: .only(left: 16)),
                      Text(
                        'Final Summary',
                        style: GoogleFonts.poppins(
                          color: AppColors.white,
                          fontWeight: .bold,
                          fontSize: 18,
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                          borderRadius: .circular(100),
                          color: AppColors.bgDark,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.lock_outline,
                            color: AppColors.grey1,
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Container(
                    height: 105,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.bgDark,
                      borderRadius: .circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        crossAxisAlignment: .start,
                        children: [
                          CircleAvatar(
                            radius: 27,
                            backgroundColor: AppColors.accentGreen,
                          ),
                          SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: .start,
                            children: [
                              Text(
                                "James Wood",
                                style: GoogleFonts.poppins(
                                  color: AppColors.white,
                                  fontSize: 16,
                                  fontWeight: .bold,
                                ),
                              ),
                              SizedBox(height: 3),
                              Text(
                                'A FanklinConvey Title',
                                style: GoogleFonts.poppins(
                                  color: AppColors.white,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Managers who want to create positive work\nenviroments',
                                style: GoogleFonts.poppins(
                                  color: AppColors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 32),
                  TrendingBooks(title: 'Similar Books'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
