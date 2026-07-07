import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:third_exam/src/core/theme/app_colors.dart';
import 'package:third_exam/src/features/auth/presentation/widgets/container_auth/app_blur_container.dart';
import 'package:third_exam/src/features/auth/presentation/widgets/selected_genres_category.dart';

class GenrePreferencesPage extends StatefulWidget {
  const GenrePreferencesPage({super.key});

  @override
  State<GenrePreferencesPage> createState() => _GenrePreferencesPageState();
}

class _GenrePreferencesPageState extends State<GenrePreferencesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              'Select Genres',
              style: GoogleFonts.poppins(
                color: AppColors.white,
                fontSize: 32,
                fontWeight: .bold,
              ),
            ),
            SizedBox(height: 16),
            AppBlurContainer(
              child: SelectedGenresCategory(),
            ),
          ],
        ),
      ),
    );
  }
}
