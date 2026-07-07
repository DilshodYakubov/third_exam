import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:third_exam/src/core/routes/pages.dart';
import 'package:third_exam/src/core/theme/app_colors.dart';

class PaymentCardModel {
  final String last4;
  final String expiry;
  final bool isVisa;
  final bool isDefault;

  PaymentCardModel({
    required this.last4,
    required this.expiry,
    this.isVisa = false,
    this.isDefault = false,
  });
}

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final List<PaymentCardModel> cards = [
    PaymentCardModel(
      last4: '4322',
      expiry: '07/2022',
      isVisa: true,
      isDefault: true,
    ),
    PaymentCardModel(last4: '1234', expiry: '07/2022'),
    PaymentCardModel(last4: '1234', expiry: '07/2022'),
    PaymentCardModel(last4: '1234', expiry: '07/2022'),
  ];

  int selectedIndex = 0;

  void _selectCard(int index) {
    setState(() => selectedIndex = index);
  }

  void _removeCard(int index) {
    setState(() {
      cards.removeAt(index);
      if (selectedIndex >= cards.length) {
        selectedIndex = cards.isEmpty ? 0 : cards.length - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Row(
                children: [
                  InkWell(
                    onTap: () => context.pop(),
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Account',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Payment',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // TODO: navigate to add-card flow
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.black,
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: AppColors.grey4),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Add a card',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(width: 6),
                          const Icon(
                            Icons.add_circle_outline,
                            color: Colors.white,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.separated(
                  itemCount: cards.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 14),
                  itemBuilder: (context, index) {
                    final card = cards[index];
                    final isSelected = index == selectedIndex;
                    return _PaymentCardTile(
                      card: card,
                      isSelected: isSelected,
                      onTap: () => _selectCard(index),
                      onDelete: () => _removeCard(index),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: SizedBox(
                  height: 48,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      context.push('${Pages.home}/${Pages.addPayment}');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.accentGreen,
                      padding: .symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add_circle_outline, color: AppColors.black),
                        SizedBox(width: 8),
                        Text(
                          'Add New Payment Method',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PaymentCardTile extends StatelessWidget {
  final PaymentCardModel card;
  final bool isSelected;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const _PaymentCardTile({
    required this.card,
    required this.isSelected,
    required this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isSelected
        ? AppColors.accentGreen
        : AppColors.grey4;
    final textColor = isSelected ? Colors.black : Colors.white;
    final subTextColor = isSelected ? Colors.black87 : AppColors.grey2;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            if (card.isVisa)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  'VISA',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            else
              Container(
                width: 44,
                height: 26,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            const SizedBox(width: 12),
            Text(
              '**** ${card.last4}',
              style: GoogleFonts.poppins(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              card.expiry,
              style: GoogleFonts.poppins(color: subTextColor, fontSize: 13),
            ),
            const Spacer(),
            if (isSelected && card.isDefault)
              Text(
                'Default',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            const SizedBox(width: 6),
            Icon(
              isSelected ? Icons.check_circle_outline : Icons.circle_outlined,
              color: isSelected ? AppColors.black : AppColors.white,
              size: 20,
            ),
            const SizedBox(width: 12),
            InkWell(
              onTap: onDelete,
              child: Icon(
                Icons.delete_outline,
                color: isSelected ? Colors.black : Colors.white70,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
