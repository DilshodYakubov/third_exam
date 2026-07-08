import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:third_exam/src/core/routes/pages.dart';
import 'package:third_exam/src/core/theme/app_colors.dart';
import 'package:third_exam/src/features/account_flow/presentation/widgets/select_credit_card.dart';

class SelectCardMethodsPage extends StatefulWidget {
  const SelectCardMethodsPage({super.key});

  @override
  State<SelectCardMethodsPage> createState() => _SelectCardMethodsPageState();
}

class _SelectCardMethodsPageState extends State<SelectCardMethodsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Padding(
        padding: .all(16),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              'Select Card',
              style: GoogleFonts.poppins(
                color: AppColors.white,
                fontSize: 24,
                fontWeight: .bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Ulimited insights from books, courses documentaries, and podcasts.',
              style: GoogleFonts.poppins(color: AppColors.grey1),
            ),
            SizedBox(height: 32),
            SelectCreditCard(),
            Spacer(),
            InkWell(
              borderRadius: .circular(100),
              onTap: () {
                context.push(Pages.premiumConguratulate);
              },
              child: Container(
                height: 48,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.accentGreen,
                  borderRadius: .circular(6),
                ),
                child: Row(
                  mainAxisAlignment: .center,
                  children: [
                    Text(
                      'Confirm',
                      style: GoogleFonts.poppins(
                        color: AppColors.grey4,
                        fontWeight: .bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
