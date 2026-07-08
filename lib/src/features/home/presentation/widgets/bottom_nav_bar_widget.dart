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
    final premiumPage = location.contains(Pages.premium);
    final hidePlayer =
        hideOnThisTab ||
        accountPage ||
        profilePage ||
        paymentPage ||
        premiumPage;
    return Scaffold(
      backgroundColor: AppColors.black,
      body: navigationShell,
      bottomNavigationBar: Container(
        width: double.infinity,
        color: AppColors.black,
        child: Column(
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

  Widget _buildTab({
    required int index,
    required String assetPath,
    required String label,
  }) {
    final selected = currentIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          height: 95,
          width: double.infinity,
          padding: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            gradient: selected
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
            color: selected ? null : AppColors.black,
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  assetPath,
                  color: selected ? AppColors.accentGreen : AppColors.grey1,
                  height: 20,
                  width: 20,
                  fit: .fitHeight,
                ),
                const SizedBox(height: 5),
                Text(
                  label,
                  style: GoogleFonts.poppins(
                    color: selected ? AppColors.accentGreen : AppColors.grey1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildTab(index: 0, assetPath: 'assets/images/home.png', label: 'Home'),
        _buildTab(
          index: 1,
          assetPath: 'assets/images/search.png',
          label: 'Explore',
        ),
        _buildTab(
          index: 2,
          assetPath: 'assets/images/books.png',
          label: 'Library',
        ),
      ],
    );
  }
}
