import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:third_exam/src/core/theme/app_colors.dart';

class PremiumCard extends StatefulWidget {
  const PremiumCard({super.key});

  @override
  State<PremiumCard> createState() => _PremiumCardState();
}

class _PremiumCardState extends State<PremiumCard> {
  int chosenCard = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                chosenCard = 0;
              });
            },
            child: chosenCard == 0
                ? Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: .circular(8),
                          color: AppColors.bgDark,
                          border: Border.all(
                            color: chosenCard == 0
                                ? AppColors.bgDark
                                : AppColors.accentGreen,
                            width: 3,
                          ),
                        ),
                        child: Padding(
                          padding: .only(right: 21, left: 21, top: 24),
                          child: Column(
                            crossAxisAlignment: .center,
                            children: [
                              Text(
                                'Monthly',
                                style: GoogleFonts.poppins(
                                  color: AppColors.grey2,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'USD 60.00',
                                style: GoogleFonts.poppins(
                                  color: AppColors.white,
                                  fontSize: 24,
                                  fontWeight: .bold,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                'Billed & recurring\n    monthly\nCancel anytime',
                                style: GoogleFonts.poppins(
                                  color: AppColors.grey2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: -14,
                        left: 80,
                        child: Container(
                          padding: .symmetric(horizontal: 6, vertical: 3),
                          decoration: BoxDecoration(
                            borderRadius: .circular(5),
                            color: AppColors.accentGreen,
                          ),
                          child: Row(
                            mainAxisAlignment: .center,
                            children: [
                              Text(
                                'Save 75%',
                                style: GoogleFonts.poppins(
                                  color: AppColors.grey4,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 185,
                        left: 100,
                        child: CircleAvatar(
                          radius: 12,
                          backgroundColor: AppColors.accentGreen,
                          child: Icon(
                            Icons.check,
                            color: AppColors.grey4,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  )
                : Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: .circular(8),
                      color: AppColors.bgDark,
                      border: Border.all(
                        color: chosenCard == 0
                            ? AppColors.bgDark
                            : AppColors.accentGreen,
                        width: 3,
                      ),
                    ),
                    child: Padding(
                      padding: .only(right: 21, left: 21, top: 24),
                      child: Column(
                        crossAxisAlignment: .center,
                        children: [
                          Text(
                            'Monthly',
                            style: GoogleFonts.poppins(color: AppColors.grey2),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'USD 60.00',
                            style: GoogleFonts.poppins(
                              color: AppColors.white,
                              fontSize: 24,
                              fontWeight: .bold,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Billed & recurring\n    monthly\nCancel anytime',
                            style: GoogleFonts.poppins(color: AppColors.grey2),
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
        ),
        //
        SizedBox(width: 16),
        Expanded(
          child: Stack(
            clipBehavior: Clip.none,
            alignment: .topCenter,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    chosenCard = 1;
                  });
                },
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.accentGreen, width: 2),
                    borderRadius: .circular(8),
                    color: AppColors.bgDark,
                  ),
                  child: Padding(
                    padding: .only(right: 21, left: 21, top: 24),
                    child: Column(
                      crossAxisAlignment: .center,
                      children: [
                        Text(
                          'Monthly',
                          style: GoogleFonts.poppins(color: AppColors.grey2),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'USD 90.00',
                          style: GoogleFonts.poppins(
                            color: AppColors.white,
                            fontSize: 24,
                            fontWeight: .bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Billed & recurring\n    monthly\nCancel anytime',
                          style: GoogleFonts.poppins(color: AppColors.grey2),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: -14,
                left: 80,
                child: Container(
                  padding: .symmetric(horizontal: 6, vertical: 3),
                  decoration: BoxDecoration(
                    borderRadius: .circular(5),
                    color: AppColors.accentGreen,
                  ),
                  child: Row(
                    mainAxisAlignment: .center,
                    children: [
                      Text(
                        'Save 75%',
                        style: GoogleFonts.poppins(
                          color: AppColors.grey4,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 185,
                left: 100,
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: AppColors.accentGreen,
                  child: Icon(Icons.check, color: AppColors.grey4, size: 20),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
