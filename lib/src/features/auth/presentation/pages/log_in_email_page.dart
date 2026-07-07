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
import 'package:third_exam/src/features/auth/presentation/widgets/app_containers.dart';
import 'package:third_exam/src/features/auth/presentation/widgets/app_textfields.dart';
import 'package:third_exam/src/features/auth/presentation/widgets/container_auth/app_blur_container.dart';

class LogInEmailPage extends StatefulWidget {
  const LogInEmailPage({super.key});

  @override
  State<LogInEmailPage> createState() => _LogInEmailPageState();
}

class _LogInEmailPageState extends State<LogInEmailPage> {
  final controller = GlobalKey<FormState>();
  final email = TextEditingController();
  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundImage(
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Padding(padding: .only(top: 162)),
            Text(
              'Log in',
              style: GoogleFonts.poppins(
                color: AppColors.white,
                fontSize: 32,
                fontWeight: .bold,
              ),
            ),
            SizedBox(height: 16),
            AppBlurContainer(
              child: Column(
                children: [
                  BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is AuthError) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(state.error)));
                      }
                    },
                    builder: (context, state) => Form(
                      key: controller,
                      child: Column(
                        crossAxisAlignment: .center,
                        children: [
                          AppTextfields(
                            title: 'Email',
                            controlle: email,
                            isDark: false,
                          ),
                          SizedBox(height: 16),
                          if (state is AuthLoading)
                            const CircularProgressIndicator()
                          else
                            AppContainerBox(
                              title: 'Continue',
                              onPressed: () {
                                if (controller.currentState!.validate()) {
                                  context.push(
                                    Pages.loginPassword,
                                    extra: email.text.trim(),
                                  );
                                }
                              },
                            ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 14),
                  TextButton(
                    onPressed: () {
                      context.push(Pages.forgotPassword);
                    },
                    child: Text(
                      'Forgot password?',
                      style: GoogleFonts.poppins(
                        color: AppColors.accentGreen,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SizedBox(height: 32),
                  Row(
                    children: [
                      Container(
                        height: 1.5,
                        width: 199,
                        color: AppColors.grey4,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Or',
                        style: GoogleFonts.poppins(color: AppColors.grey2),
                      ),
                      SizedBox(width: 10),
                      Container(
                        height: 1.5,
                        width: 199,
                        color: AppColors.grey4,
                      ),
                    ],
                  ),
                  SizedBox(height: 32),
                  AppContainers(),
                  SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: .center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: GoogleFonts.poppins(color: AppColors.white),
                      ),
                      SizedBox(width: 5),
                      InkWell(
                        onTap: () {
                          context.push(Pages.signUp);
                        },
                        child: Text(
                          'Sign Up',
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
          ],
        ),
      ),
    );
  }
}
