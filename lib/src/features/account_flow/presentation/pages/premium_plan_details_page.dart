import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:third_exam/src/core/routes/pages.dart';
import 'package:third_exam/src/core/theme/app_colors.dart';
import 'package:third_exam/src/features/account_flow/presentation/widgets/premium_opportunity.dart';

class PremiumPlanDetailsPage extends StatefulWidget {
  const PremiumPlanDetailsPage({super.key});

  @override
  State<PremiumPlanDetailsPage> createState() =>
      _PremiumPlansDetailsPageState();
}

class _PremiumPlansDetailsPageState extends State<PremiumPlanDetailsPage> {
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
              style: GoogleFonts.poppins(color: AppColors.white, fontSize: 32),
            ),
            SizedBox(height: 16),
            Text(
              'Ulimited insights from books, courses documentaries, and podcasts.',
              style: GoogleFonts.poppins(color: AppColors.grey1),
            ),
            SizedBox(height: 32),
            Text(
              'Limited time offer today',
              style: GoogleFonts.poppins(
                color: AppColors.white,
                fontWeight: .bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
            PremiumOpportunity(),
            SizedBox(height: 32),
            InkWell(
              onTap: () {
                context.push(Pages.premiumAddpayment);
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
                        fontWeight: .bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 7),
            Row(
              mainAxisAlignment: .center,
              children: [
                Text(
                  'only \$79.99/year',
                  style: GoogleFonts.poppins(color: AppColors.grey2),
                ),
              ],
            ),
            SizedBox(height: 23),
            Row(
              mainAxisAlignment: .center,
              children: [
                InkWell(
                  onTap: () {},
                  child: Text(
                    'VIEW ALL PLANS',
                    style: GoogleFonts.poppins(
                      color: AppColors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
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
