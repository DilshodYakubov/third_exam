import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:third_exam/src/core/theme/app_colors.dart';

class CategoryOfThemeBook extends StatelessWidget {
  const CategoryOfThemeBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Wrap(children: [_Category(text: 'Personal growth')]),
            SizedBox(width: 8),
            Wrap(children: [_Category(text: 'Culture & Society')]),
          ],
        ),
        SizedBox(height: 16),
        Row(
          children: [
            _Category(text: 'Fiction'),
            SizedBox(width: 8),
            _Category(text: 'Mind & Philosophy'),
          ],
        ),
      ],
    );
  }

  Widget _Category({required String text}) {
    return Container(
      padding: .symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.grey4,
        borderRadius: .circular(10),
      ),
      child: Text(text, style: GoogleFonts.poppins(color: AppColors.grey1)),
    );
  }
}
