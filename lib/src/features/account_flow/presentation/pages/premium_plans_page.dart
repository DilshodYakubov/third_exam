import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:third_exam/src/core/routes/pages.dart';
import 'package:third_exam/src/core/theme/app_colors.dart';

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
              style: GoogleFonts.poppins(color: AppColors.white, fontSize: 32),
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
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: .circular(8),
                      color: AppColors.bgDark,
                    ),
                    child: Padding(
                      padding: .only(right: 21, left: 21, top: 24),
                      child: Column(
                        crossAxisAlignment: .center,
                        children: [
                          Text(
                            'Monthly',
                            style: GoogleFonts.poppins(color: AppColors.grey2),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'USD 60.00',
                            style: GoogleFonts.poppins(
                              color: AppColors.white,
                              fontSize: 24,
                              fontWeight: .bold,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Billed & recurring\n    monthly\nCancel anytime',
                            style: GoogleFonts.poppins(color: AppColors.grey2),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: .topCenter,
                    children: [
                      Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.accentGreen,
                            width: 2,
                          ),
                          borderRadius: .circular(8),
                          color: AppColors.bgDark,
                        ),
                        child: Padding(
                          padding: .only(right: 21, left: 21, top: 24),
                          child: Column(
                            crossAxisAlignment: .center,
                            children: [
                              Text(
                                'Monthly',
                                style: GoogleFonts.poppins(
                                  color: AppColors.grey2,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'USD 90.00',
                                style: GoogleFonts.poppins(
                                  color: AppColors.white,
                                  fontSize: 24,
                                  fontWeight: .bold,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                'Billed & recurring\n    monthly\nCancel anytime',
                                style: GoogleFonts.poppins(
                                  color: AppColors.grey2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: -14,
                        left: 80,
                        child: Container(
                          padding: .symmetric(horizontal: 6, vertical: 3),
                          decoration: BoxDecoration(
                            borderRadius: .circular(5),
                            color: AppColors.accentGreen,
                          ),
                          child: Row(
                            mainAxisAlignment: .center,
                            children: [
                              Text(
                                'Save 75%',
                                style: GoogleFonts.poppins(
                                  color: AppColors.grey4,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 185,
                        left: 100,
                        child: CircleAvatar(
                          radius: 12,
                          backgroundColor: AppColors.accentGreen,
                          child: Icon(
                            Icons.check,
                            color: AppColors.grey4,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
