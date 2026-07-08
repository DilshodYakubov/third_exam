import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:third_exam/src/core/routes/pages.dart';
import 'package:third_exam/src/core/theme/app_colors.dart';

class Topics extends StatefulWidget {
  const Topics({super.key});

  @override
  State<Topics> createState() => _TopicsState();
}

class _TopicsState extends State<Topics> {
  final List<String> topics = [
    'Personal growth',
    'Culture & Society',
    'Fiction',
    'Mind & Philosophy',
    'Health & Fitness',
    'Biographies',
    'Education',
    'History',
    'Future',
    'Technology',
    'Life style',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          spacing: 10,
          runSpacing: 13,
          children: topics.map((topic) {
            return InkWell(
              borderRadius: .circular(100),
              onTap: () {
                context.push(Pages.productsListing, extra: topic);
              },
              child: Chip(
                label: Text(
                  topic,
                  style: GoogleFonts.poppins(color: AppColors.grey1),
                ),
                backgroundColor: AppColors.grey4,
                side: BorderSide(color: AppColors.grey4),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
