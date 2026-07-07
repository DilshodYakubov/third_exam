import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:third_exam/src/core/routes/pages.dart';
import 'package:third_exam/src/core/theme/app_colors.dart';
import 'package:third_exam/src/features/account_flow/presentation/widgets/account_options.dart';

class AccountPage extends StatefulWidget {
  final String email;
  const AccountPage({super.key, required this.email});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: .all(16),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              TextButton(
                onPressed: () {
                  context.pop(Pages.home);
                },
                child: Row(
                  mainAxisSize: .min,
                  children: [
                    Icon(
                      Icons.keyboard_arrow_left_outlined,
                      color: AppColors.white,
                      size: 30,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Home',
                      style: GoogleFonts.poppins(color: AppColors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.only(left: 2),
                child: Text(
                  'Account',
                  style: GoogleFonts.poppins(
                    color: AppColors.white,
                    fontSize: 24,
                    fontWeight: .bold,
                  ),
                ),
              ),
              Divider(
                thickness: 2,
                endIndent: 360,
                color: AppColors.accentGreen,
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: AppColors.accentGreen,
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        'John Doe',
                        style: GoogleFonts.poppins(
                          color: AppColors.white,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        widget.email,
                        style: GoogleFonts.poppins(color: AppColors.grey1),
                      ),
                    ],
                  ),
                  Spacer(),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.accentGreen,
                    ),
                    onPressed: () {
                      context.push(Pages.premium);
                    },
                    child: Text(
                      "Premuim",
                      style: GoogleFonts.poppins(color: AppColors.grey4),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Divider(color: AppColors.grey4),
              SizedBox(height: 24),
              AccountOptions(
                icon: Icon(
                  Icons.person_outline_outlined,
                  color: AppColors.accentGreen,
                ),
                text: "Profile details",
                ontap: () {
                  context.push('${Pages.home}/${Pages.profile}');
                },
              ),
              SizedBox(height: 24),
              AccountOptions(
                icon: Icon(Icons.credit_card, color: AppColors.accentGreen),
                text: "Payment",
                ontap: () {
                  context.push('${Pages.home}/${Pages.payment}');
                },
              ),
              SizedBox(height: 24),
              AccountOptions(
                icon: Icon(Icons.star, color: AppColors.accentGreen),
                text: "Subscription",
                ontap: () {},
              ),
              SizedBox(height: 24),
              Divider(color: AppColors.grey4),
              SizedBox(height: 24),
              AccountOptions(
                icon: Icon(Icons.question_mark, color: AppColors.accentGreen),
                text: "FAQs",
                ontap: () {},
              ),
              SizedBox(height: 24),
              AccountOptions(
                icon: Icon(Icons.logout, color: AppColors.accentGreen),
                text: "Logout",
                ontap: () {},
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: InkWell(
          borderRadius: .circular(100),
          onTap: () {},
          child: Container(
            height: 64,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: .circular(8),
              color: AppColors.bgDark,
            ),
            child: Row(
              mainAxisAlignment: .center,
              children: [
                Image.asset('assets/images/head_phone.png'),
                SizedBox(width: 8),
                Text(
                  'Feel free to ask, We are here to help',
                  style: GoogleFonts.poppins(color: AppColors.accentGreen),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
