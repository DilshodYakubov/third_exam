import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:third_exam/src/core/theme/app_colors.dart';
import 'package:third_exam/src/features/auth/presentation/widgets/app_background_image.dart';
import 'package:third_exam/src/features/auth/presentation/widgets/app_container_box.dart';
import 'package:third_exam/src/features/auth/presentation/widgets/app_textfields.dart';
import 'package:third_exam/src/features/auth/presentation/widgets/container_auth/app_blur_container.dart';

class CodeVerifiedPage extends StatefulWidget {
  const CodeVerifiedPage({super.key});

  @override
  State<CodeVerifiedPage> createState() => _CodePageState();
}

class _CodePageState extends State<CodeVerifiedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundImage(
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .start,
          children: [
            Text(
              'Set Password',
              style: GoogleFonts.poppins(
                color: AppColors.white,
                fontSize: 32,
                fontWeight: .bold,
              ),
            ),
            SizedBox(height: 16),
            AppBlurContainer(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/check.png',
                    color: AppColors.accentGreen,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Code verified',
                    style: GoogleFonts.poppins(
                      color: AppColors.white,
                      fontStyle: .italic,
                    ),
                  ),
                  SizedBox(height: 24),
                  AppTextfields(
                    title: 'Enter new password',
                    controlle: TextEditingController(),
                    isSuffics: true,
                    isDark: false,
                  ),
                  SizedBox(height: 16),
                  AppTextfields(
                    title: 'Re-type new password',
                    controlle: TextEditingController(),
                    isSuffics: true,
                    isDark: false,
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: .start,
                    children: [
                      Text(
                        'At- least 8 charecters',
                        style: GoogleFonts.poppins(color: AppColors.grey2),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  AppContainerBox(
                    title: 'Set Password',
                    onPressed: () {
                      context.go('/genres');
                    },
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
