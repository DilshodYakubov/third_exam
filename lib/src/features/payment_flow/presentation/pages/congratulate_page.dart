import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:third_exam/src/core/routes/pages.dart';
import 'package:third_exam/src/core/theme/app_colors.dart';

class CongratulatePage extends StatefulWidget {
  const CongratulatePage({super.key});

  @override
  State<CongratulatePage> createState() => _CongratulatePageState();
}

class _CongratulatePageState extends State<CongratulatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Padding(
        padding: .all(16),
        child: Column(
          crossAxisAlignment: .center,
          children: [
            Padding(padding: .only(top: 100)),
            Image.asset(
              'assets/images/check.png',
              color: AppColors.white,
              height: 100,
              width: 100,
              fit: .fill,
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'We’re giving you Premium\n access for 3 days, for free',
                style: GoogleFonts.poppins(
                  color: AppColors.white,
                  fontSize: 24,
                  fontWeight: .bold,
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Ulimited insights from books, courses\n      documentaries, and podcasts.',
                style: GoogleFonts.poppins(color: AppColors.grey1),
              ),
            ),
            Spacer(),
            InkWell(
              borderRadius: .circular(100),
              onTap: () {
                context.push(Pages.premiumOverview);
              },
              child: Container(
                height: 48,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.accentGreen,
                  borderRadius: .circular(6),
                ),
                child: Row(
                  mainAxisAlignment: .center,
                  children: [
                    Text(
                      'Confirm',
                      style: GoogleFonts.poppins(
                        color: AppColors.grey4,
                        fontWeight: .bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
