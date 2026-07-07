import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:third_exam/src/core/routes/pages.dart';
import 'package:third_exam/src/core/theme/app_colors.dart';
import 'package:third_exam/src/features/auth/presentation/widgets/app_textfields.dart';
import 'package:third_exam/src/features/explore/presentation/widgets/topics.dart';
import 'package:third_exam/src/features/home/presentation/widgets/trending_books.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Explore',
                style: GoogleFonts.poppins(
                  color: AppColors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(
                color: AppColors.accentGreen,
                endIndent: 375,
                thickness: 2,
              ),
              const SizedBox(height: 25),
              AppTextfields(
                typing: true,
                onTap: () {
                  context.push(Pages.search);
                },
                isDark: true,
                title: 'Title, author or keyword',
                controlle: TextEditingController(),
                isPrefix: true,
              ),
              SizedBox(height: 41),
              Text(
                'Topics',
                style: GoogleFonts.poppins(
                  color: AppColors.white,
                  fontSize: 20,
                  fontWeight: .bold,
                ),
              ),
              SizedBox(height: 16),
              Topics(),
              SizedBox(height: 40),
              TrendingBooks(title: 'Fiction'),
              TrendingBooks(title: 'Culture & Society'),
              TrendingBooks(title: 'Life style'),
            ],
          ),
        ),
      ),
    );
  }
}
