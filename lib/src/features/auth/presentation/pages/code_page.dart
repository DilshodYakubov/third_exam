import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:third_exam/src/core/theme/app_colors.dart';
import 'package:third_exam/src/features/auth/presentation/widgets/app_background_image.dart';
import 'package:third_exam/src/features/auth/presentation/widgets/app_container_box.dart';
import 'package:third_exam/src/features/auth/presentation/widgets/app_textfields.dart';
import 'package:third_exam/src/features/auth/presentation/widgets/container_auth/app_blur_container.dart';

class CodePage extends StatefulWidget {
  const CodePage({super.key});

  @override
  State<CodePage> createState() => _CodePageState();
}

class _CodePageState extends State<CodePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundImage(
        child: Column(
          crossAxisAlignment: .start,
          children: [
            InkWell(
              onTap: () {
                context.pop('/login_email');
              },
              child: Row(
                mainAxisSize: .min,
                children: [
                  Icon(
                    Icons.keyboard_arrow_left,
                    color: AppColors.white,
                    size: 28,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Back to Log in',
                    style: GoogleFonts.poppins(color: AppColors.white),
                  ),
                ],
              ),
            ),
            SizedBox(height: 150),
            Text(
              'Verify Code',
              style: GoogleFonts.poppins(
                color: AppColors.white,
                fontSize: 32,
                fontWeight: .bold,
              ),
            ),
            SizedBox(height: 16),
            AppBlurContainer(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    'An authentication code has been sent to your email.',
                    style: GoogleFonts.poppins(color: AppColors.white),
                  ),
                  SizedBox(height: 16),
                  AppTextfields(
                    title: 'Enter Code',
                    controlle: TextEditingController(),
                    isDark: false,
                  ),
                  SizedBox(height: 16),
                  AppContainerBox(
                    title: 'Verify',
                    onPressed: () {
                      context.push('/code_verified');
                    },
                  ),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: .center,
                    children: [
                      Text(
                        "Don't receive a code?",
                        style: GoogleFonts.poppins(color: AppColors.white),
                      ),
                      SizedBox(width: 5),
                      InkWell(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Row(
                                mainAxisSize: .min,
                                children: [CircularProgressIndicator()],
                              ),
                            ),
                          );
                        },
                        child: Row(
                          mainAxisSize: .min,
                          children: [
                            Text(
                              'Resend',
                              style: GoogleFonts.poppins(
                                color: AppColors.accentGreen,
                                fontWeight: .w500,
                              ),
                            ),
                            SizedBox(width: 5),
                            Image.asset(
                              'assets/images/reset.png',
                              color: AppColors.accentGreen,
                              height: 15,
                              width: 15,
                            ),
                          ],
                        ),
                      ),
                    ],
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
