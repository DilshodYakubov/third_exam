import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:third_exam/src/core/theme/app_colors.dart';

class AccountOptions extends StatelessWidget {
  final void Function() ontap;
  final Icon icon;
  final String text;
  const AccountOptions({
    super.key,
    required this.icon,
    required this.text,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      borderRadius: .circular(100),
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: .circular(10),
              color: AppColors.grey4,
            ),
            child: Center(child: icon),
          ),
          SizedBox(width: 16),
          Text(text, style: GoogleFonts.poppins(color: AppColors.white)),
          Spacer(),
          Icon(Icons.keyboard_arrow_right, color: AppColors.white),
        ],
      ),
    );
  }
}
