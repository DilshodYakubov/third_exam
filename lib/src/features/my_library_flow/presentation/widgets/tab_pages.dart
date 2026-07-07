import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:third_exam/src/core/theme/app_colors.dart';

class TabPages extends StatelessWidget {
  const TabPages({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 12,
        childAspectRatio: 0.48,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: .start,
          children: [
            Container(
              height: 340,
              width: double.infinity,
              decoration: BoxDecoration(color: AppColors.accentGreen),
            ),
            SizedBox(height: 16),
            Text(
              'The good guy',
              style: GoogleFonts.poppins(color: AppColors.white),
            ),
            SizedBox(height: 4),
            Text(
              'Mark mcallister',
              style: GoogleFonts.poppins(color: AppColors.white, fontSize: 12),
            ),
            SizedBox(height: 8),
            Text(
              'A story about a guy who was very\ngood until the very end when every',
              style: GoogleFonts.poppins(color: AppColors.white, fontSize: 10),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: .start,
              children: [
                Container(
                  padding: .only(left: 5, right: 5, bottom: 5, top: 5),
                  decoration: BoxDecoration(
                    color: AppColors.accentGreen,
                    borderRadius: .circular(7),
                  ),
                  child: Row(
                    mainAxisAlignment: .center,
                    children: [
                      Image.asset(
                        'assets/images/headphone.png',
                        color: AppColors.grey4,
                      ),
                      SizedBox(width: 5),
                      Text(
                        '5m',
                        style: GoogleFonts.poppins(
                          color: AppColors.grey4,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16),
                Container(
                  padding: .only(left: 5, right: 5, bottom: 5, top: 5),
                  decoration: BoxDecoration(
                    color: AppColors.grey1,
                    borderRadius: .circular(7),
                  ),
                  child: Row(
                    mainAxisAlignment: .center,
                    children: [
                      Image.asset(
                        'assets/images/read.png',
                        color: AppColors.grey4,
                      ),
                      SizedBox(width: 5),
                      Text(
                        '8m',
                        style: GoogleFonts.poppins(
                          color: AppColors.grey4,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class TabPages2 extends StatelessWidget {
  const TabPages2({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 12,
        childAspectRatio: 0.48,
      ),
      itemCount: 2,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: .start,
          children: [
            Container(
              height: 340,
              width: double.infinity,
              decoration: BoxDecoration(color: AppColors.accentGreen),
            ),
            SizedBox(height: 16),
            Text(
              'The good guy',
              style: GoogleFonts.poppins(color: AppColors.white),
            ),
            SizedBox(height: 4),
            Text(
              'Mark mcallister',
              style: GoogleFonts.poppins(color: AppColors.white, fontSize: 12),
            ),
            SizedBox(height: 8),
            Text(
              'A story about a guy who was very\ngood until the very end when every',
              style: GoogleFonts.poppins(color: AppColors.white, fontSize: 10),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: .start,
              children: [
                Container(
                  height: 24,
                  padding: .only(left: 7, right: 7, bottom: 5, top: 5),
                  decoration: BoxDecoration(
                    color: AppColors.accentGreen,
                    borderRadius: .circular(7),
                  ),
                  child: Text(
                    '65% completed',
                    style: GoogleFonts.poppins(
                      color: AppColors.grey4,
                      fontSize: 10,
                      fontWeight: .w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class TabPages3 extends StatelessWidget {
  const TabPages3({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 12,
        childAspectRatio: 0.48,
      ),
      itemCount: 2,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: .start,
          children: [
            Container(
              height: 340,
              width: double.infinity,
              decoration: BoxDecoration(color: AppColors.accentGreen),
            ),
            SizedBox(height: 16),
            Text(
              'The good guy',
              style: GoogleFonts.poppins(color: AppColors.white),
            ),
            SizedBox(height: 4),
            Text(
              'Mark mcallister',
              style: GoogleFonts.poppins(color: AppColors.white, fontSize: 12),
            ),
            SizedBox(height: 8),
            Text(
              'A story about a guy who was very\ngood until the very end when every',
              style: GoogleFonts.poppins(color: AppColors.white, fontSize: 10),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: .start,
              children: [
                Container(
                  padding: .only(left: 5, right: 5, bottom: 5, top: 5),
                  decoration: BoxDecoration(
                    color: AppColors.accentGreen,
                    borderRadius: .circular(7),
                  ),
                  child: Row(
                    mainAxisAlignment: .center,
                    children: [
                      Image.asset(
                        'assets/images/headphone.png',
                        color: AppColors.grey4,
                      ),
                      SizedBox(width: 5),
                      Text(
                        '5m',
                        style: GoogleFonts.poppins(
                          color: AppColors.grey4,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16),
                Container(
                  padding: .only(left: 5, right: 5, bottom: 5, top: 5),
                  decoration: BoxDecoration(
                    color: AppColors.grey1,
                    borderRadius: .circular(7),
                  ),
                  child: Row(
                    mainAxisAlignment: .center,
                    children: [
                      Image.asset(
                        'assets/images/read.png',
                        color: AppColors.grey4,
                      ),
                      SizedBox(width: 5),
                      Text(
                        '8m',
                        style: GoogleFonts.poppins(
                          color: AppColors.grey4,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
