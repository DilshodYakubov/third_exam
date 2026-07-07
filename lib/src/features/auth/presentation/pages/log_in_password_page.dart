import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:third_exam/src/core/routes/pages.dart';
import 'package:third_exam/src/core/theme/app_colors.dart';
import 'package:third_exam/src/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:third_exam/src/features/auth/presentation/cubit/auth_state.dart';
import 'package:third_exam/src/features/auth/presentation/session/user_session.dart';
import 'package:third_exam/src/features/auth/presentation/widgets/app_background_image.dart';
import 'package:third_exam/src/features/auth/presentation/widgets/app_container_box.dart';
import 'package:third_exam/src/features/auth/presentation/widgets/app_textfields.dart';
import 'package:third_exam/src/features/auth/presentation/widgets/container_auth/app_blur_container.dart';

class LogInPasswordPage extends StatefulWidget {
  final String email;
  const LogInPasswordPage({super.key, required this.email});

  @override
  State<LogInPasswordPage> createState() => _LogInPasswordPageState();
}

class _LogInPasswordPageState extends State<LogInPasswordPage> {
  final password = TextEditingController();
  final controller = GlobalKey<FormState>();
  @override
  void dispose() {
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundImage(
        child: Column(
          crossAxisAlignment: .start,
          mainAxisAlignment: .center,
          children: [
            Text(
              'Log In',
              style: GoogleFonts.poppins(
                color: AppColors.white,
                fontWeight: .bold,
                fontSize: 32,
              ),
            ),
            SizedBox(height: 16),
            AppBlurContainer(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(radius: 35, foregroundColor: Colors.red),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: .start,
                        children: [
                          Text(
                            'John Doe',
                            style: GoogleFonts.poppins(
                              color: AppColors.white,
                              fontSize: 16,
                              fontWeight: .bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            widget.email,
                            style: GoogleFonts.poppins(color: AppColors.grey2),
                          ),
                        ],
                      ),
                      Spacer(),
                      Icon(
                        Icons.check_circle_outlined,
                        color: AppColors.accentGreen,
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is AuthError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Email yoki parol noto\'g\'ri'),
                          ),
                        );
                      } else if (state is AuthSuccess) {
                        UserSession.setEmail(widget.email);
                        context.go(Pages.genres);
                      }
                    },
                    builder: (context, state) => Form(
                      key: controller,
                      child: Column(
                        children: [
                          AppTextfields(
                            title: 'Password',
                            controlle: password,
                            isSuffics: true,
                            isValidate: true,
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
                                  context.read<AuthCubit>().signIn(
                                    widget.email,
                                    password.text.trim(),
                                  );
                                }
                              },
                            ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 14),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        context.push('/forgot_password');
                      },
                      child: Text(
                        'Forgot password?',
                        style: GoogleFonts.poppins(
                          color: AppColors.accentGreen,
                          fontSize: 14,
                        ),
                      ),
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
