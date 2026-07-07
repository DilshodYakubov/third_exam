import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:third_exam/src/core/routes/pages.dart';
import 'package:third_exam/src/core/services/mini_player_visibility.dart';
import 'package:third_exam/src/core/theme/app_colors.dart';
import 'package:third_exam/src/features/home/presentation/widgets/mini_player.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  void _onTap(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    const hiddenOnTabIndexes = <int>{1};
    final hideOnThisTab = hiddenOnTabIndexes.contains(
      navigationShell.currentIndex,
    );
    final location = GoRouterState.of(context).uri.toString();
    final accountPage = location.contains(Pages.account);
    final profilePage = location.contains(Pages.profile);
    final paymentPage = location.contains(Pages.payment);
    final hidePlayer =
        hideOnThisTab || accountPage || profilePage || paymentPage;
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ValueListenableBuilder<bool>(
            valueListenable: MiniPlayerVisibility.isVisible,
            builder: (context, visible, child) {
              final shouldShow = visible && !hidePlayer;
              return AnimatedSize(
                duration: const Duration(milliseconds: 200),
                child: shouldShow ? const MiniPlayer() : const SizedBox(),
              );
            },
          ),
          BottomNavBarWidget2(
            currentIndex: navigationShell.currentIndex,
            onTap: _onTap,
          ),
        ],
      ),
    );
  }
}

class BottomNavBarWidget2 extends StatelessWidget {
  const BottomNavBarWidget2({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => onTap(0),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 220),
            height: 95,
            width: 166,
            padding: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              gradient: currentIndex == 0
                  ? LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.gradient,
                        AppColors.gradient2,
                        AppColors.gradient3,
                      ],
                    )
                  : null,
              color: currentIndex == 0 ? null : AppColors.black,
            ),
            child: Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/home.png',
                    color: currentIndex == 0
                        ? AppColors.accentGreen
                        : AppColors.grey1,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Home',
                    style: GoogleFonts.poppins(
                      color: currentIndex == 0
                          ? AppColors.accentGreen
                          : AppColors.grey1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => onTap(1),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 220),
            height: 95,
            width: 167,
            padding: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              gradient: currentIndex == 1
                  ? LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.gradient,
                        AppColors.gradient2,
                        AppColors.gradient3,
                      ],
                    )
                  : null,
              color: currentIndex == 1 ? null : AppColors.black,
            ),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/search.png',
                  color: currentIndex == 1
                      ? AppColors.accentGreen
                      : AppColors.grey1,
                ),
                const SizedBox(height: 5),
                Text(
                  'Explore',
                  style: GoogleFonts.poppins(
                    color: currentIndex == 1
                        ? AppColors.accentGreen
                        : AppColors.grey1,
                  ),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () => onTap(2),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 220),
            height: 95,
            width: 167,
            padding: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              gradient: currentIndex == 2
                  ? LinearGradient(
                      colors: [
                        AppColors.gradient,
                        AppColors.gradient2,
                        AppColors.gradient3,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    )
                  : null,
              color: currentIndex == 2 ? null : AppColors.black,
            ),
            child: Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/books.png',
                    color: currentIndex == 2
                        ? AppColors.accentGreen
                        : AppColors.grey1,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Library',
                    style: GoogleFonts.poppins(
                      color: currentIndex == 2
                          ? AppColors.accentGreen
                          : AppColors.grey1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
