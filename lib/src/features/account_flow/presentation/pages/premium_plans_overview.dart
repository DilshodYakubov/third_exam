import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:third_exam/src/core/routes/pages.dart';
import 'package:third_exam/src/core/theme/app_colors.dart';

class PremiumPlansOverview extends StatefulWidget {
  const PremiumPlansOverview({super.key});

  @override
  State<PremiumPlansOverview> createState() => _PremiumPlansOverviewState();
}

class _PremiumPlansOverviewState extends State<PremiumPlansOverview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              'Premium Plan\nOverview',
              style: GoogleFonts.poppins(
                color: AppColors.white,
                fontSize: 32,
                fontWeight: .w600,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Ulimited insights from books, courses documentaries, and podcasts.',
              style: GoogleFonts.poppins(color: AppColors.grey1),
            ),
            SizedBox(height: 32),
            Text(
              'Premium Individual',
              style: GoogleFonts.poppins(
                color: AppColors.white,
                fontWeight: .bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: .circular(10),
                color: AppColors.bgDark,
                border: Border.all(color: AppColors.accentGreen, width: 3),
              ),
              child: Column(
                mainAxisAlignment: .center,
                crossAxisAlignment: .center,
                children: [
                  Text(
                    'Monthly',
                    style: GoogleFonts.poppins(color: AppColors.grey1),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Offer Experies',
                    style: GoogleFonts.poppins(
                      color: AppColors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Your premium subscription plan ending on\n7-19-22. You can renew your plan to enjoy ads\n                              free readings.',
                    style: GoogleFonts.poppins(color: AppColors.grey1),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32),
            InkWell(
              onTap: () {},
              child: Container(
                height: 48,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: .circular(8),
                  color: AppColors.accentGreen,
                ),
                child: Row(
                  mainAxisAlignment: .center,
                  children: [
                    Text(
                      "Start 3-day free trail now",
                      style: GoogleFonts.poppins(
                        color: AppColors.grey4,
                        fontWeight: .bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: .center,
              children: [
                InkWell(
                  onTap: () {
                    context.pop('${Pages.home}/${Pages.account}');
                  },
                  child: Text(
                    'NO THANKS',
                    style: GoogleFonts.poppins(
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: .bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 32),
            Text(
              'Your membership starts as soon as you set up payment and subscribe. Your monthly charge will occur on the last day of the current billing period. We’ll renew your membership for you can manage your subscription or turn off auto-renewal under accounts setting.',
              style: GoogleFonts.poppins(color: AppColors.grey1, fontSize: 12),
            ),
            SizedBox(height: 8),
            Text(
              'By continuing, you are agreeing to these terms. See the privac statement and restricions.',
              style: GoogleFonts.poppins(color: AppColors.grey1, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
