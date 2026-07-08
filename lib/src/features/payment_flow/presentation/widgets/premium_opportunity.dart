import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:third_exam/src/core/theme/app_colors.dart';

class PremiumOpportunity extends StatelessWidget {
  const PremiumOpportunity({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: .start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    'What you get',
                    style: GoogleFonts.poppins(
                      color: AppColors.white,
                      fontWeight: .bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Unlimied Hacks',
              style: GoogleFonts.poppins(color: AppColors.grey1),
            ),
            SizedBox(height: 5),
            Text(
              'Personalised content',
              style: GoogleFonts.poppins(color: AppColors.grey1),
            ),
            SizedBox(height: 5),

            Text(
              'Collecion challenges',
              style: GoogleFonts.poppins(color: AppColors.grey1),
            ),
            SizedBox(height: 5),

            Text(
              'Unlimited boards',
              style: GoogleFonts.poppins(color: AppColors.grey1),
            ),
            SizedBox(height: 5),

            Text(
              'Streak repair',
              style: GoogleFonts.poppins(color: AppColors.grey1),
            ),
            SizedBox(height: 5),
          ],
        ),
        Spacer(),
        Column(
          crossAxisAlignment: .center,
          children: [
            Text(
              'Free',
              style: GoogleFonts.poppins(
                color: AppColors.white,
                fontWeight: .bold,
              ),
            ),
            SizedBox(height: 12),
            Text('Limited', style: GoogleFonts.poppins(color: AppColors.grey1)),
            SizedBox(height: 8),
            Icon(Icons.close, color: AppColors.white, size: 18),
            SizedBox(height: 8),
            Icon(Icons.close, color: AppColors.white, size: 18),
            SizedBox(height: 8),
            Icon(Icons.close, color: AppColors.white, size: 18),
            SizedBox(height: 8),
            Icon(Icons.close, color: AppColors.white, size: 18),
            SizedBox(height: 8),
          ],
        ),
        SizedBox(width: 12),
        Container(
          height: 183,
          width: 96,
          padding: .all(8),
          decoration: BoxDecoration(
            borderRadius: .circular(10),
            color: AppColors.bgDark,
            border: Border.all(color: AppColors.accentGreen),
          ),
          child: Column(
            crossAxisAlignment: .center,
            children: [
              Container(
                height: 25,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: .circular(5),
                  color: AppColors.accentGreen,
                ),
                child: Row(
                  mainAxisAlignment: .center,
                  children: [
                    Text(
                      'Premium',
                      style: GoogleFonts.poppins(
                        color: AppColors.grey4,
                        fontWeight: .bold,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Icon(Icons.check, color: AppColors.white, size: 18),
              SizedBox(height: 8),
              Icon(Icons.check, color: AppColors.white, size: 18),
              SizedBox(height: 8),
              Icon(Icons.check, color: AppColors.white, size: 18),
              SizedBox(height: 8),
              Icon(Icons.check, color: AppColors.white, size: 18),
              SizedBox(height: 8),
              Text(
                '1/month',
                style: GoogleFonts.poppins(
                  color: AppColors.white,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
