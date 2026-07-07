import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:third_exam/src/core/theme/app_colors.dart';
import 'package:third_exam/src/features/auth/domain/entities/selected_ganres.dart';
import 'package:third_exam/src/features/auth/presentation/widgets/app_container_box.dart';

class SelectedGenresCategory extends StatefulWidget {
  const SelectedGenresCategory({super.key});

  @override
  State<SelectedGenresCategory> createState() => _SelectedGenresCategoryState();
}

class _SelectedGenresCategoryState extends State<SelectedGenresCategory> {
  bool showMore = false;

  final List<Genre> genres = [
    Genre(title: "Fiction"),
    Genre(title: "Novel"),
    Genre(title: "Narrative"),
    Genre(title: "Historical Fiction"),
    Genre(title: "Non-fiction"),
    Genre(title: "Mystery"),
    Genre(title: "Horror"),
    Genre(title: "Children's Literature"),
    Genre(title: "Thriller"),
    Genre(title: "Sci-Fi"),
    Genre(title: "Romantic"),
    Genre(title: "History"),
    Genre(title: "Poetry"),
    Genre(title: "Biography"),
    Genre(title: "Crime"),
    Genre(title: "Autobiography"),
    Genre(title: "Cookbook"),
  ];

  final List<Genre> moreGenres = [
    Genre(title: "Fantasy"),
    Genre(title: "Drama"),
    Genre(title: "Comedy"),
    Genre(title: "Adventure"),
    Genre(title: "Travel"),
    Genre(title: "Business"),
    Genre(title: "Self Help"),
    Genre(title: "Education"),
    Genre(title: "Technology"),
    Genre(title: "Programming"),
    Genre(title: "Religion"),
    Genre(title: "Philosophy"),
  ];

  int get selectedCount =>
      [...genres, ...moreGenres].where((e) => e.selected).length;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(
          "Select the type of book you enjoy reading.",
          style: GoogleFonts.poppins(color: AppColors.grey1),
        ),

        const SizedBox(height: 24),

        SizedBox(
          height: 360,
          child: LayoutBuilder(
            builder: (context, constraints) => SingleChildScrollView(
              child: SizedBox(
                width: constraints.maxWidth,
                child: Column(
                  children: [
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 8,
                      runSpacing: 10,
                      children: [
                        buildChip(genres[0]),
                        buildChip(genres[1]),
                        buildChip(genres[2]),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 8,
                      runSpacing: 10,
                      children: [buildChip(genres[3]), buildChip(genres[4])],
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 8,
                      runSpacing: 10,
                      children: [buildChip(genres[5]), buildChip(genres[6])],
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 8,
                      runSpacing: 10,
                      children: [buildChip(genres[7]), buildChip(genres[8])],
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 8,
                      runSpacing: 10,
                      children: [
                        buildChip(genres[9]),
                        buildChip(genres[10]),
                        buildChip(genres[11]),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 8,
                      runSpacing: 10,
                      children: [
                        buildChip(genres[12]),
                        buildChip(genres[13]),
                        buildChip(genres[14]),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 8,
                      runSpacing: 10,
                      children: [buildChip(genres[15]), buildChip(genres[16])],
                    ),
                    SizedBox(height: 8),
                    if (showMore)
                      Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 8,
                        runSpacing: 10,
                        children: [...moreGenres.map(buildChip)],
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),

        GestureDetector(
          onTap: () {
            setState(() {
              showMore = !showMore;
            });
          },
          child: Center(
            child: Text(
              showMore ? "Show less" : "Show more",
              style: GoogleFonts.poppins(
                color: AppColors.accentGreen,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 28),
        AppContainerBox(
          title: 'Continue',
          onPressed: () => selectedCount >= 3
              ? {
                  context.go('/home')
                }
              : null,
        ),
        const SizedBox(height: 14),
        Center(
          child: Text(
            "Select 3 or more genres to continue",
            style: const TextStyle(color: AppColors.white, fontSize: 15),
          ),
        ),
      ],
    );
  }
  Widget buildChip(Genre genre) {
    return GestureDetector(
      onTap: () {
        setState(() {
          genre.selected = !genre.selected;
        });
      },
      child: AnimatedContainer(
        height: 42,
        duration: const Duration(milliseconds: 220),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: genre.selected ? AppColors.accentGreen : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: genre.selected ? AppColors.accentGreen : Colors.white12,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              genre.title,
              style: GoogleFonts.poppins(
                color: genre.selected ? AppColors.grey4 : AppColors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 6),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: genre.selected ? AppColors.black : AppColors.white,
                  width: 1.7,
                ),
              ),
              child: Center(
                child: Icon(
                  genre.selected ? Icons.check : Icons.add,
                  size: 12,
                  color: genre.selected ? AppColors.black : AppColors.white,
                  fontWeight: .w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
