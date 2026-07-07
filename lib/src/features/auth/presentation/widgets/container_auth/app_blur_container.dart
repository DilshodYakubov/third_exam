import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:third_exam/src/core/theme/app_colors.dart';

class AppBlurContainer extends StatelessWidget {
  final Widget child;
  const AppBlurContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: .circular(10),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: double.infinity,
          padding: .only(left: 16, top: 24, right: 16, bottom: 24),
          decoration: BoxDecoration(
            color: AppColors.grey4.withValues(alpha: 0.5),
            borderRadius: .circular(10),
          ),
          child: child,
        ),
      ),
    );
  }
}
