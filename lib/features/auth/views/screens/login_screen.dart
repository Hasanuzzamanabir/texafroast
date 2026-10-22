import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:texafrost/features/auth/view_models/auth_view_model.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/imagepath.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../routes/app_routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController(
    text: 'd.martinez@protra.com',
  );
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 36.h),

              // PROTRA Brand Logo (Left Aligned as per Figma)
              Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  ImagePath.appLogoImage,
                  width: 140.w,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 32.h),

              // Title: Welcome back
              Text(
                'Welcome back',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 26.sp,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.5,
                ),
              ),
              SizedBox(height: 6.h),

              // Subtitle
              Text(
                'Sign in to your technician account',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 36.h),

              // EMAIL ADDRESS Field
              CustomTextFieldWidget(
                label: 'EMAIL ADDRESS',
                hintText: 'Enter your email',
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 18.h),

              // PASSWORD Field
              CustomTextFieldWidget(
                label: 'PASSWORD',
                hintText: 'Enter your password',
                controller: _passwordController,
                obscureText: authProvider.obscurePassword,
                suffixIcon: GestureDetector(
                  onTap: () {
                    context.read<AuthProvider>().togglePasswordVisibility();
                  },
                  child: Icon(
                    authProvider.obscurePassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: AppColors.inputHint,
                    size: 20.sp,
                  ),
                ),
              ),
              SizedBox(height: 16.h),

              // Remember me & Forgot Password Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.read<AuthProvider>().toggleRememberMe();
                    },
                    child: Row(
                      children: [
                        Container(
                          width: 18.w,
                          height: 18.h,
                          decoration: BoxDecoration(
                            color: authProvider.rememberMe
                                ? AppColors.orangeStart
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(4.r),
                            border: Border.all(
                              color: authProvider.rememberMe
                                  ? AppColors.orangeStart
                                  : AppColors.inputBorder,
                              width: 1.5,
                            ),
                          ),
                          child: authProvider.rememberMe
                              ? Icon(
                                  Icons.check,
                                  size: 13.sp,
                                  color: Colors.white,
                                )
                              : null,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          'Remember me',
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Forgot Password Action
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.forgotPassword);
                    },
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(
                        color: AppColors.orangeStart,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 28.h),

              // Sign In Orange Gradient Button[cite: 1]
              CustomButtonWidget(
                title: authProvider.isLoading ? 'Log in...' : 'Log in',
                type: ButtonType.orange,
                onTap: () async {
                  if (authProvider.isLoading) return;
                  final success = await context.read<AuthProvider>().login(
                        _emailController.text,
                        _passwordController.text,
                      );
                if (success && context.mounted) {
  Navigator.pushReplacementNamed(
    context,
    AppRoutes.home,
  );
}
                },
              ),
              SizedBox(height: 24.h),

              // Divider with 'or'
              Row(
                children: [
                  const Expanded(
                    child: Divider(
                      color: AppColors.inputBorder,
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Text(
                      'or',
                      style: TextStyle(
                        color: AppColors.inputHint,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Divider(
                      color: AppColors.inputBorder,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),

           

              SizedBox(height: 48.h),

              // Footer Version Details
              Text(
                'PROTRA Field Management v2.4.1',
                style: TextStyle(
                  color: AppColors.inputHint,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                '©2026 PROTRA Systems Inc.',
                style: TextStyle(
                  color: AppColors.inputHint.withOpacity(0.7),
                  fontSize: 11.sp,
                ),
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}