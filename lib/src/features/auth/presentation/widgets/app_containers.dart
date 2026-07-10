import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:third_exam/src/core/theme/app_colors.dart';

// ignore: must_be_immutable
class AppContainers extends StatelessWidget {
  List<Map<String, dynamic>> items = [
    {'images': 'assets/images/facebook.png', 'title': 'Login with Facebook'},
    {'images': 'assets/images/google.png', 'title': 'Login with Google'},
    {'images': 'assets/images/apple.png', 'title': 'Login with Apple'},
  ];
  AppContainers({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 176,
      width: double.infinity,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(height: 16),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            borderRadius: .circular(100),
            child: Container(
              height: 48,
              width: double.infinity,
              padding: .only(left: 16),
              decoration: BoxDecoration(
                borderRadius: .circular(10),
                color: AppColors.white,
              ),
              child: Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Image.asset(
                    items[index]['images'] ?? '',
                    height: 24,
                    width: 24,
                  ),
                  Text(
                    items[index]['title'] ?? '',
                    style: GoogleFonts.poppins(
                      color: AppColors.grey4,
                      fontWeight: .bold,
                    ),
                  ),
                  SizedBox(height: 40, width: 40),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
