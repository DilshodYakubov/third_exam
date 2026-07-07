import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:third_exam/src/core/theme/app_colors.dart';
import 'package:third_exam/src/features/home/presentation/widgets/data_books.dart';
import 'package:third_exam/src/features/home/presentation/widgets/mini_player_card.dart';
import 'package:third_exam/src/features/home/presentation/widgets/trending_books.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: .all(16),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Image.asset('assets/images/text.png'),
                  Image.asset('assets/images/settings.png'),
                ],
              ),
              SizedBox(height: 16),

              DataBooks(),
              SizedBox(height: 32),
              Text(
                'Continue playing',
                style: GoogleFonts.poppins(
                  color: AppColors.white,
                  fontSize: 24,
                  fontWeight: .bold,
                ),
              ),
              SizedBox(height: 16),
              MiniPlayerCard(
                title: 'The good guy',
                author: 'Mark mcallister',
                duration: const Duration(minutes: 5, seconds: 10),
                initialPosition: const Duration(minutes: 1, seconds: 14),
                onTap: () {},
              ),
              SizedBox(height: 32),
              Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/news.png'),
                    fit: .cover,
                  ),
                  borderRadius: .circular(10),
                ),
              ),
              SizedBox(height: 32),
              TrendingBooks(title: 'For you'),
              TrendingBooks2(title: 'Trending'),
              TrendingBooks(title: '5-Minutes read'),
            ],
          ),
        ),
      ),
    );
  }
}
