import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:third_exam/src/core/theme/app_colors.dart';
import 'package:third_exam/src/features/auth/presentation/widgets/app_background_image.dart';
import 'package:third_exam/src/features/auth/presentation/widgets/app_container_box.dart';
import 'package:third_exam/src/features/auth/presentation/widgets/app_textfields.dart';
import 'package:third_exam/src/features/auth/presentation/widgets/container_auth/app_blur_container.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
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
              'Recover Password',
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
                    'Forgot your password? Don\'t worry, enter your email to reset your current password.',
                    style: GoogleFonts.poppins(color: AppColors.white),
                  ),
                  SizedBox(height: 16),
                  AppTextfields(
                    title: 'Email',
                    controlle: TextEditingController(),
                    isDark: false,
                  ),
                  SizedBox(height: 16),
                  AppContainerBox(
                    title: 'Sumbit',
                    onPressed: () {
                      context.push('/code');
                    },
                  ),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: .center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: GoogleFonts.poppins(color: AppColors.white),
                      ),
                      SizedBox(width: 5),
                      InkWell(
                        onTap: () {
                          context.push('/sign_up');
                        },
                        child: Text(
                          'Sign Up',
                          style: GoogleFonts.poppins(
                            color: AppColors.accentGreen,
                            fontWeight: .bold,
                          ),
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
