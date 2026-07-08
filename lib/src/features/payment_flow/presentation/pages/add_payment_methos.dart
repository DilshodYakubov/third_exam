import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:third_exam/src/core/theme/app_colors.dart';

class AddPaymentMethos extends StatefulWidget {
  const AddPaymentMethos({super.key});

  @override
  State<AddPaymentMethos> createState() => _AddPaymentMethosState();
}

class _AddPaymentMethosState extends State<AddPaymentMethos> {
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
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: Row(
                mainAxisSize: .min,
                children: [
                  Icon(
                    Icons.keyboard_arrow_left,
                    size: 30,
                    color: AppColors.white,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Payment',
                    style: GoogleFonts.poppins(color: AppColors.white),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Add payment method',
              style: GoogleFonts.poppins(
                color: AppColors.accentGreen,
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
            Container(
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
                    'Add Payment Method',
                    style: GoogleFonts.poppins(
                      color: AppColors.black,
                      fontWeight: .bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
