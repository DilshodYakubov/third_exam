import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:third_exam/src/core/theme/app_colors.dart';

class SelectCreditCard extends StatefulWidget {
  const SelectCreditCard({super.key});

  @override
  State<SelectCreditCard> createState() => _SelectCreditCardState();
}

class _SelectCreditCardState extends State<SelectCreditCard> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              selectedIndex = 0;
            });
          },
          borderRadius: .circular(100),
          child: Container(
            height: 48,
            padding: .all(12),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: .circular(5),
              color: AppColors.grey4,
            ),
            child: Row(
              children: [
                Image.asset('assets/images/visa_card.png'),
                SizedBox(width: 16),
                Text(
                  '**** 4322',
                  style: GoogleFonts.poppins(
                    color: AppColors.white,
                    fontWeight: .bold,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  '07/2022',
                  style: GoogleFonts.poppins(color: AppColors.grey2),
                ),
                Spacer(),
                selectedIndex == 0
                    ? Icon(Icons.check_circle_outline, color: AppColors.white)
                    : Icon(Icons.circle_outlined, color: AppColors.white),
              ],
            ),
          ),
        ),
        SizedBox(height: 16),
        InkWell(
          onTap: () {
            setState(() {
              selectedIndex = 1;
            });
          },
          borderRadius: .circular(100),
          child: Container(
            height: 48,
            padding: .all(12),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: .circular(5),
              color: AppColors.grey4,
            ),
            child: Row(
              children: [
                Image.asset('assets/images/credit_card.png'),
                SizedBox(width: 16),
                Text(
                  '**** 1234',
                  style: GoogleFonts.poppins(
                    color: AppColors.white,
                    fontWeight: .bold,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  '07/2022',
                  style: GoogleFonts.poppins(color: AppColors.grey2),
                ),
                Spacer(),
                selectedIndex == 1
                    ? Icon(Icons.check_circle_outline, color: AppColors.white)
                    : Icon(Icons.circle_outlined, color: AppColors.white),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
