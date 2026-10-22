import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:texafrost/core/constants/imagepath.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _progressController;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();

    _progressController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );

    _progressAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _progressController,
        curve: Curves.easeInOut,
      ),
    );

    _progressController.forward();

    Timer(const Duration(milliseconds: 2800), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, AppRoutes.onboarding);
      }
    });
  }

  @override
  void dispose() {
    _progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.Background,
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),

            // Center: App Logo & Subtitle
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    ImagePath.appLogoImage,
                    width: 170.w,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    'HVAC FIELD MANAGEMENT',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2.5,
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),

            Padding(
              padding: EdgeInsets.only(bottom: 40.h),
              child: Center(
                child: Container(
                  width: 120.w,
                  height: 3.h,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E2129), 
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                  alignment: Alignment.centerLeft,
                  child: AnimatedBuilder(
                    animation: _progressAnimation,
                    builder: (context, child) {
                      return Container(
                        width: 120.w * _progressAnimation.value,
                        decoration: BoxDecoration(
                          color: AppColors.orangeStart,
                          borderRadius: BorderRadius.circular(2.r),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}