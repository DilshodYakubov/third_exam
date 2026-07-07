import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:third_exam/src/core/theme/app_colors.dart';

class BottomSheetBookRead extends StatefulWidget {
  const BottomSheetBookRead({super.key});

  @override
  State<BottomSheetBookRead> createState() => _BottomSheetBookReadState();
}

class _BottomSheetBookReadState extends State<BottomSheetBookRead> {
  bool onPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        backgroundColor: AppColors.black,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        context.pop();
                      },
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        size: 35,
                        color: AppColors.white,
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        setState(() {
                          onPressed = !onPressed;
                        });
                      },
                      borderRadius: .circular(100),
                      child: Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          borderRadius: .circular(100),
                          color: AppColors.accentGreen,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: onPressed
                              ? Image.asset('assets/images/pause.png')
                              : Image.asset('assets/images/play.png'),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Image.asset('assets/images/head_phone.png'),
                    SizedBox(width: 16),
                    Icon(Icons.more_vert, color: AppColors.white),
                  ],
                ),
                SizedBox(height: 24),
                Text(
                  "What is in it for me? Learn how to become an effecive unofficial project manager",
                  style: GoogleFonts.poppins(
                    color: AppColors.white,
                    fontSize: 24,
                    fontWeight: .bold,
                  ),
                ),
                SizedBox(height: 17),
                Text(
                  "Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove\nright at the coast of the Semantics, a large language ocean. A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.",
                  style: GoogleFonts.poppins(color: AppColors.white),
                ),
                SizedBox(height: 17),
                Text(
                  "The Big Oxmox advised her not to do so, because there were thousands of bad Commas, wild Question Marks and devious Semikoli, but the Little Blind Text didn’t listen.",
                  style: GoogleFonts.poppins(color: AppColors.white),
                ),
                SizedBox(height: 17),
                Text(
                  "Little Blind Text didn’t listen. She packed her seven versalia, put her initial into the belt and made herself on the way.",
                  style: GoogleFonts.poppins(color: AppColors.white),
                ),
                SizedBox(height: 17),
                Text(
                  "Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then",
                  style: GoogleFonts.poppins(color: AppColors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
