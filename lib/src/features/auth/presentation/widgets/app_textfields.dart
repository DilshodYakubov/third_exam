import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:third_exam/src/core/theme/app_colors.dart';

class AppTextfields extends StatefulWidget {
  final bool? typing;
  final void Function()? onTap;
  final bool isDark;
  final bool? isPrefix;
  final bool? isValidate;
  final bool? isSuffics;
  final String title;
  final GlobalKey<FormState>? controller;
  final TextEditingController controlle;
  const AppTextfields({
    super.key,
    this.controller,
    required this.title,
    this.isSuffics,
    required this.controlle,
    this.isValidate,
    this.isPrefix,
    required this.isDark,
    this.onTap,
    this.typing,
  });

  @override
  State<AppTextfields> createState() => _AppTextfieldsState();
}

class _AppTextfieldsState extends State<AppTextfields> {
  bool eye = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.controller,
      child: TextFormField(
        readOnly: widget.typing != null,
        style: GoogleFonts.poppins(
          color: widget.isDark ? AppColors.white : AppColors.grey2,
        ),
        onTap: widget.onTap,
        obscuringCharacter: '✱',
        obscureText: eye,
        controller: widget.controlle,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(
              color: widget.isDark ? AppColors.grey3 : AppColors.white,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(
              color: widget.isDark ? AppColors.grey3 : AppColors.white,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(color: AppColors.valid),
          ),
          fillColor: widget.isDark ? AppColors.grey4 : AppColors.white,
          filled: true,
          hint: Text(
            widget.title,
            style: GoogleFonts.poppins(
              color: widget.isDark ? AppColors.grey3 : AppColors.grey2,
            ),
          ),
          prefixIcon: widget.isPrefix != null
              ? Padding(
                  padding: .only(left: 6),
                  child: Image.asset(
                    'assets/images/search.png',
                    color: AppColors.grey1,
                  ),
                )
              : null,
          suffixIcon: widget.isSuffics != null
              ? Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        eye = !eye;
                      });
                    },
                    icon: eye
                        ? Icon(
                            Icons.visibility_off_outlined,
                            color: AppColors.grey3,
                          )
                        : Icon(
                            Icons.visibility_outlined,
                            color: AppColors.grey3,
                          ),
                  ),
                )
              : null,
        ),
        validator: widget.isValidate != null
            ? (value) {
                if (value == null || value.isEmpty) {
                  return 'emailni to\'ldiring';
                }
                final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                if (!emailRegex.hasMatch(value.trim())) {
                  return "Email noto'g'ri";
                }
                return null;
              }
            : null,
      ),
    );
  }
}
