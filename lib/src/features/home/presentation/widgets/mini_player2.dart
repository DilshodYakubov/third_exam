import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:third_exam/src/core/theme/app_colors.dart';

class MiniPlayer2 extends StatefulWidget {
  const MiniPlayer2({super.key});

  @override
  State<MiniPlayer2> createState() => _MiniPlayer2State();
}

class _MiniPlayer2State extends State<MiniPlayer2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 149,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: .circular(10),
        gradient: LinearGradient(
          colors: [AppColors.valid, AppColors.grey3, AppColors.grey3],
          begin: .bottomLeft,
          end: .center,
        ),
      ),
      child: Row(
        children: [
          Container(height: 99, width: 143, color: AppColors.containerGradient),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                'The good guy',
                style: GoogleFonts.poppins(
                  color: AppColors.white,
                  fontWeight: .bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Mark mcallister',
                style: GoogleFonts.poppins(
                  color: AppColors.grey2,
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 24),
              
            ],
          ),
        ],
      ),
    );
  }
}
