import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:third_exam/src/core/routes/pages.dart';
import 'package:third_exam/src/core/theme/app_colors.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Padding(
        padding: .all(16),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            TextButton(
              onPressed: () {
                context.pop(Pages.account);
              },
              child: Row(
                mainAxisSize: .min,
                children: [
                  Icon(
                    Icons.keyboard_arrow_left_outlined,
                    color: AppColors.white,
                    size: 30,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Back',
                    style: GoogleFonts.poppins(
                      color: AppColors.white,
                      fontStyle: .italic,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Text(
              'Pofile details',
              style: GoogleFonts.poppins(
                color: AppColors.white,
                fontSize: 24,
                fontWeight: .bold,
              ),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: .center,
              children: [
                Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: .circular(100),
                            color: AppColors.containerGradient,
                          ),
                        ),
                        Positioned(
                          top: 55,
                          bottom: 0,
                          right: 0,
                          left: 55,
                          child: Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              borderRadius: .circular(100),
                              color: AppColors.accentGreen,
                            ),
                            child: Center(child: Icon(Icons.download_outlined)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Change profile picture',
                      style: GoogleFonts.poppins(
                        color: AppColors.accentGreen,
                        fontSize: 12,
                        fontStyle: .italic,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 32),
            Divider(color: AppColors.grey4),
            SizedBox(height: 32),
            Text(
              'Your Name',
              style: GoogleFonts.poppins(color: AppColors.grey1),
            ),
            SizedBox(height: 8),
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
                  borderSide: BorderSide(color: AppColors.grey4),
                ),
                filled: true,
                fillColor: AppColors.grey4,
                hint: Text(
                  'Name',
                  style: GoogleFonts.poppins(color: AppColors.grey1),
                ),
                suffixIcon: Padding(
                  padding: .only(right: 5),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.keyboard_arrow_right,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),
            Text('Email', style: GoogleFonts.poppins(color: AppColors.grey1)),
            SizedBox(height: 8),
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
                  borderSide: BorderSide(color: AppColors.grey4),
                ),
                filled: true,
                fillColor: AppColors.grey4,
                hint: Text(
                  'Email',
                  style: GoogleFonts.poppins(color: AppColors.grey1),
                ),
                suffixIcon: Padding(
                  padding: .only(right: 5),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.keyboard_arrow_right,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Date of Birth',
              style: GoogleFonts.poppins(color: AppColors.grey1),
            ),
            SizedBox(height: 8),
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
                  borderSide: BorderSide(color: AppColors.grey4),
                ),
                filled: true,
                fillColor: AppColors.grey4,
                hint: Text(
                  'Date',
                  style: GoogleFonts.poppins(color: AppColors.grey1),
                ),
                suffixIcon: Padding(
                  padding: .only(right: 5),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.keyboard_arrow_right,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
