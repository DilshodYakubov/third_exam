import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:third_exam/src/core/theme/app_colors.dart';

class ProductsListingPages extends StatelessWidget {
  final String title;
  const ProductsListingPages({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.black,
            leading: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: Icon(Icons.keyboard_arrow_left, color: AppColors.white),
            ),
            pinned: true,
            expandedHeight: 110,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.only(left: 15, bottom: 16),
              centerTitle: false,
              title: Text(
                title,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 28,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          // Сетка/список карточек ниже
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 12,
                childAspectRatio: 0.48,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) => BookCard(),
                childCount: 8,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BookCard extends StatelessWidget {
  const BookCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Container(
          height: 340,
          width: double.infinity,
          decoration: BoxDecoration(color: AppColors.accentGreen),
        ),
        SizedBox(height: 16),
        Text(
          'The good guy',
          style: GoogleFonts.poppins(color: AppColors.white),
        ),
        SizedBox(height: 4),
        Text(
          'Mark mcallister',
          style: GoogleFonts.poppins(color: AppColors.white, fontSize: 12),
        ),
        SizedBox(height: 8),
        Text(
          'A story about a guy who was very\ngood until the very end when every',
          style: GoogleFonts.poppins(color: AppColors.white, fontSize: 10),
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: .start,
          children: [
            Container(
              padding: .only(left: 5, right: 5, bottom: 5, top: 5),
              decoration: BoxDecoration(
                color: AppColors.accentGreen,
                borderRadius: .circular(7),
              ),
              child: Row(
                mainAxisAlignment: .center,
                children: [
                  Image.asset(
                    'assets/images/headphone.png',
                    color: AppColors.grey4,
                  ),
                  SizedBox(width: 5),
                  Text(
                    '5m',
                    style: GoogleFonts.poppins(
                      color: AppColors.grey4,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 16),
            Container(
              padding: .only(left: 5, right: 5, bottom: 5, top: 5),
              decoration: BoxDecoration(
                color: AppColors.grey1,
                borderRadius: .circular(7),
              ),
              child: Row(
                mainAxisAlignment: .center,
                children: [
                  Image.asset('assets/images/read.png', color: AppColors.grey4),
                  SizedBox(width: 5),
                  Text(
                    '8m',
                    style: GoogleFonts.poppins(
                      color: AppColors.grey4,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
