import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:third_exam/src/core/routes/pages.dart';
import 'package:third_exam/src/core/theme/app_colors.dart';
import 'package:third_exam/src/features/payment_flow/presentation/widgets/premium_card.dart';

class PremiumPlansPage extends StatefulWidget {
  const PremiumPlansPage({super.key});

  @override
  State<PremiumPlansPage> createState() => _PremiumPlansPageState();
}

class _PremiumPlansPageState extends State<PremiumPlansPage> {
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
              'Try Book Nexus\nPremmiun',
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
              'All Premium Plans',
              style: GoogleFonts.poppins(
                color: AppColors.white,
                fontWeight: .bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            PremiumCard(),
            SizedBox(height: 32),
            InkWell(
              onTap: () {
                context.push(Pages.premiumDetails);
              },
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
                        fontWeight: .w600,
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
