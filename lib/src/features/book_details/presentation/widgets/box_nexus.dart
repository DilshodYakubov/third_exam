import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:third_exam/src/core/theme/app_colors.dart';
import 'package:third_exam/src/features/book_details/presentation/pages/audio_player_page.dart';
import 'package:third_exam/src/features/book_details/presentation/widgets/bottom_sheet_book_read.dart';

class BoxNexus extends StatelessWidget {
  const BoxNexus({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.bgDark,
        borderRadius: .circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: .center,
          children: [
            Spacer(),
            Image.asset(
              'assets/images/read_book.png',
              color: AppColors.white,
              height: 24,
              width: 24,
            ),
            SizedBox(width: 5),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                  scrollControlDisabledMaxHeightRatio: 1,
                  context: context,
                  builder: (context) {
                    return BottomSheetBookRead();
                  },
                );
              },
              child: Text(
                'Read Nexus',
                style: GoogleFonts.poppins(color: AppColors.white),
              ),
            ),
            Spacer(),
            Container(
              width: 1,
              height: double.infinity,
              decoration: BoxDecoration(color: AppColors.bgLight),
            ),
            Spacer(),
            Image.asset('assets/images/head_phone.png', color: AppColors.white),
            SizedBox(width: 5),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                  scrollControlDisabledMaxHeightRatio: 1,
                  context: context,
                  builder: (context) {
                    return AudioPlayerPage();
                  },
                );
              },
              child: Text(
                'Play Nexus',
                style: GoogleFonts.poppins(color: AppColors.white),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

class BoxNexus2 extends StatelessWidget {
  const BoxNexus2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.bgDark,
        borderRadius: .circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: .center,
          children: [
            Spacer(),
            Image.asset('assets/images/time.png', color: AppColors.white),
            SizedBox(width: 5),
            Text('18 min', style: GoogleFonts.poppins(color: AppColors.white)),
            Spacer(),
            Container(
              width: 1,
              height: double.infinity,
              decoration: BoxDecoration(color: AppColors.bgLight),
            ),
            Spacer(),
            Image.asset('assets/images/bulb.png', color: AppColors.white),
            SizedBox(width: 5),
            Text(
              '6 key ideas',
              style: GoogleFonts.poppins(color: AppColors.white),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
