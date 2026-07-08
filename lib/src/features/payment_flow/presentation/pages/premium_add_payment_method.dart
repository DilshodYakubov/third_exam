import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:third_exam/src/core/routes/pages.dart';
import 'package:third_exam/src/core/theme/app_colors.dart';

class PremiumAddPaymentMethod extends StatefulWidget {
  const PremiumAddPaymentMethod({super.key});

  @override
  State<PremiumAddPaymentMethod> createState() =>
      _PremiumAddPaymentMethodState();
}

class _PremiumAddPaymentMethodState extends State<PremiumAddPaymentMethod> {
  final TextEditingController _cardController = TextEditingController();
  bool _isNotEmpty = false;

  @override
  void initState() {
    _cardController.addListener(() {
      final notEmpty = _cardController.text.trim().isNotEmpty;
      if (notEmpty != _isNotEmpty) {
        setState(() {
          _isNotEmpty = notEmpty;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _cardController.dispose();
    super.dispose();
  }

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
              'Add payment method',
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
            //------------------------------------------------------------------
            TextField(
              style: GoogleFonts.poppins(color: AppColors.grey1),
              controller: _cardController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: .circular(10),
                  borderSide: BorderSide(color: AppColors.grey4),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: .circular(10),
                  borderSide: BorderSide(color: AppColors.grey1),
                ),
                hint: Text(
                  'Card number',
                  style: GoogleFonts.poppins(color: AppColors.grey3),
                ),
                fillColor: AppColors.grey4,
                filled: true,
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: _isNotEmpty
                      ? Image.asset('assets/images/visa_card.png')
                      : null,
                ),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              style: GoogleFonts.poppins(color: AppColors.grey1),
              controller: TextEditingController(),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: .circular(10),
                  borderSide: BorderSide(color: AppColors.grey4),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: .circular(10),
                  borderSide: BorderSide(color: AppColors.grey1),
                ),
                hint: Text(
                  'Cardholder name',
                  style: GoogleFonts.poppins(color: AppColors.grey3),
                ),
                fillColor: AppColors.grey4,
                filled: true,
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    style: GoogleFonts.poppins(color: AppColors.grey1),
                    controller: TextEditingController(),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: .circular(10),
                        borderSide: BorderSide(color: AppColors.grey4),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: .circular(10),
                        borderSide: BorderSide(color: AppColors.grey1),
                      ),
                      hint: Text(
                        'CVV',
                        style: GoogleFonts.poppins(color: AppColors.grey3),
                      ),
                      fillColor: AppColors.grey4,
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    style: GoogleFonts.poppins(color: AppColors.grey1),
                    controller: TextEditingController(),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: .circular(10),
                        borderSide: BorderSide(color: AppColors.grey4),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: .circular(10),
                        borderSide: BorderSide(color: AppColors.grey1),
                      ),
                      hint: Text(
                        'MM/YY',
                        style: GoogleFonts.poppins(color: AppColors.grey3),
                      ),
                      fillColor: AppColors.grey4,
                      filled: true,
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            InkWell(
              borderRadius: .circular(100),
              onTap: () {
                context.push(Pages.premiumSelectCard);
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
