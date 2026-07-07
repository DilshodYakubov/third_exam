import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:third_exam/src/core/theme/app_colors.dart';

class AppContainerBox extends StatelessWidget {
  final void Function() onPressed;
  final String title;
  const AppContainerBox({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.accentGreen,
          shape: RoundedRectangleBorder(borderRadius: .circular(10)),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: GoogleFonts.poppins(color: AppColors.grey4, fontWeight: .bold),
        ),
      ),
    );
  }
}
