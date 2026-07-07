import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:third_exam/src/core/routes/pages.dart';
import 'package:third_exam/src/core/theme/app_colors.dart';
import 'package:third_exam/src/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:third_exam/src/features/auth/presentation/cubit/auth_state.dart';
import 'package:third_exam/src/features/auth/presentation/widgets/app_background_image.dart';
import 'package:third_exam/src/features/auth/presentation/widgets/app_container_box.dart';
import 'package:third_exam/src/features/auth/presentation/widgets/app_textfields.dart';
import 'package:third_exam/src/features/auth/presentation/widgets/container_auth/app_blur_container.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundImage(
        child: Column(
          crossAxisAlignment: .start,
          mainAxisAlignment: .center,
          children: [
            Text(
              'Sign up',
              style: GoogleFonts.poppins(
                color: AppColors.white,
                fontSize: 32,
                fontWeight: .bold,
              ),
            ),
            SizedBox(height: 16),
            AppBlurContainer(
              child: Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      "Looks like you don't have an account.\nLet's create a new account for you.",
                      style: GoogleFonts.poppins(color: AppColors.grey1),
                    ),
                    SizedBox(height: 24),
                    AppTextfields(
                      title: 'Name',
                      controlle: name,
                      isDark: false,
                    ),
                    SizedBox(height: 16),
                    AppTextfields(
                      title: 'Email',
                      controlle: email,
                      isDark: false,
                      isValidate: true,
                    ),
                    SizedBox(height: 16),
                    AppTextfields(
                      title: 'Password',
                      controlle: password,
                      isDark: false,
                      isSuffics: true,
                    ),
                    SizedBox(height: 16),
                    Text(
                      "By selecting Create Account below, I agree to",
                      style: GoogleFonts.poppins(color: AppColors.grey2),
                    ),
                    Text(
                      'Terms of Service & Privacy Police',
                      style: GoogleFonts.poppins(
                        color: AppColors.accentGreen,
                        fontWeight: .bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    BlocConsumer<AuthCubit, AuthState>(
                      listener: (context, state) {
                        if (state is AuthError) {
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(SnackBar(content: Text(state.error)));
                        } else if (state is AuthSuccess) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.user.email!)),
                          );
                          context.go(Pages.genres);
                        }
                      },
                      builder: (context, state) {
                        return AppContainerBox(
                          title: 'Create Account',
                          onPressed: () {
                            context.read<AuthCubit>().signUp(
                              email.text..trim(),
                              password.text.trim(),
                            );
                          },
                        );
                      },
                    ),

                    SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: .center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: GoogleFonts.poppins(color: AppColors.grey2),
                        ),
                        SizedBox(width: 5),
                        InkWell(
                          onTap: () {
                            context.pop(Pages.loginEmail);
                          },
                          child: Text(
                            'Log In',
                            style: GoogleFonts.poppins(
                              color: AppColors.accentGreen,
                              fontWeight: .bold,
                            ),
                          ),
                        ),
                      ],
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
