import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:third_exam/src/core/theme/app_colors.dart';

class PremiumAddPaymentMethod extends StatefulWidget {
  const PremiumAddPaymentMethod({super.key});

  @override
  State<PremiumAddPaymentMethod> createState() =>
      _PremiumAddPaymentMethodState();
}

class _PremiumAddPaymentMethodState extends State<PremiumAddPaymentMethod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Padding(
        padding: .all(16),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              'Add payment method',
              style: GoogleFonts.poppins(
                color: AppColors.accentGreen,
                fontSize: 24,
                fontWeight: .bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Ulimited insights from books, courses documentaries, and podcasts.',
              style: GoogleFonts.poppins(color: AppColors.grey1),
            ),
            SizedBox(height: 32),
            TextField(
              style: GoogleFonts.poppins(color: AppColors.grey1),
              controller: TextEditingController(),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: .circular(10),
                  borderSide: BorderSide(color: AppColors.grey4),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: .circular(10),
                  borderSide: BorderSide(color: AppColors.grey1),
                ),
                hint: Text(
                  'Card number',
                  style: GoogleFonts.poppins(color: AppColors.grey3),
                ),
                fillColor: AppColors.grey4,
                filled: true,
              ),
            ),
            SizedBox(height: 16),
            TextField(
              style: GoogleFonts.poppins(color: AppColors.grey1),
              controller: TextEditingController(),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: .circular(10),
                  borderSide: BorderSide(color: AppColors.grey4),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: .circular(10),
                  borderSide: BorderSide(color: AppColors.grey1),
                ),
                hint: Text(
                  'Cardholder name',
                  style: GoogleFonts.poppins(color: AppColors.grey3),
                ),
                fillColor: AppColors.grey4,
                filled: true,
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    style: GoogleFonts.poppins(color: AppColors.grey1),
                    controller: TextEditingController(),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: .circular(10),
                        borderSide: BorderSide(color: AppColors.grey4),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: .circular(10),
                        borderSide: BorderSide(color: AppColors.grey1),
                      ),
                      hint: Text(
                        'CVV',
                        style: GoogleFonts.poppins(color: AppColors.grey3),
                      ),
                      fillColor: AppColors.grey4,
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    style: GoogleFonts.poppins(color: AppColors.grey1),
                    controller: TextEditingController(),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: .circular(10),
                        borderSide: BorderSide(color: AppColors.grey4),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: .circular(10),
                        borderSide: BorderSide(color: AppColors.grey1),
                      ),
                      hint: Text(
                        'MM/YY',
                        style: GoogleFonts.poppins(color: AppColors.grey3),
                      ),
                      fillColor: AppColors.grey4,
                      filled: true,
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            Container(
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
                    'Add Payment Method',
                    style: GoogleFonts.poppins(
                      color: AppColors.black,
                      fontWeight: .bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
