import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:texafrost/core/constants/app_colors.dart';
import 'package:texafrost/core/constants/imagepath.dart';
import 'package:texafrost/features/auth/views/widgets/pin_keypad_widget.dart';
import 'package:texafrost/routes/app_routes.dart';

class PinScreen extends StatefulWidget {
  const PinScreen({super.key});

  @override
  State<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  String _pin = '';
  bool _isLoading = false;

  void _onKeyPressed(String digit) {
    if (_pin.length < 4 && !_isLoading) {
      setState(() {
        _pin += digit;
      });

      if (_pin.length == 4) {
        _handlePinComplete();
      }
    }
  }

  void _onBackspace() {
    if (_pin.isNotEmpty && !_isLoading) {
      setState(() {
        _pin = _pin.substring(0, _pin.length - 1);
      });
    }
  }

  Future<void> _handlePinComplete() async {
    setState(() {
      _isLoading = true;
    });

    // Verification simulation
    await Future.delayed(const Duration(milliseconds: 500));

    if (mounted) {
      setState(() {
        _isLoading = false;
      });
      Navigator.pushReplacementNamed(context, AppRoutes.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 18.h),

              // PROTRA Brand Logo (Centered)
              Image.asset(
                ImagePath.appLogoImage,
                width: 145.w,
                fit: BoxFit.contain,
              ),

              SizedBox(height: 28.h),

              // Technician Profile Avatar
              Container(
                width: 68.r,
                height: 68.r,
                decoration: BoxDecoration(
                  color: AppColors.orangeStart,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.orangeStart.withValues(alpha: 0.28),
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(
                    Icons.person,
                    size: 38.sp,
                    color: const Color(0xFF2563EB), // Blue person silhouette
                  ),
                ),
              ),

              SizedBox(height: 14.h),

              // Technician Name
              Text(
                'David Martinez',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.3,
                ),
              ),

              SizedBox(height: 4.h),

              // Role & ID
              Text(
                'HVAC Technician · ID #TEC-0047',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),

              SizedBox(height: 24.h),

              // 4 PIN Dots Indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  final isFilled = index < _pin.length;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: EdgeInsets.symmetric(horizontal: 7.w),
                    width: 14.r,
                    height: 14.r,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isFilled
                          ? AppColors.orangeStart
                          : const Color(0xFFF1F5F9),
                      border: Border.all(
                        color: isFilled
                            ? AppColors.orangeStart
                            : const Color(0xFFCBD5E1),
                        width: 1.5,
                      ),
                      boxShadow: isFilled
                          ? [
                              BoxShadow(
                                color: AppColors.orangeStart.withValues(alpha: 0.3),
                                blurRadius: 6,
                                offset: const Offset(0, 2),
                              )
                            ]
                          : null,
                    ),
                  );
                }),
              ),

              SizedBox(height: 28.h),

              // Numeric Keypad
              PinKeypadWidget(
                onKeyPressed: _onKeyPressed,
                onBackspace: _onBackspace,
              ),

              SizedBox(height: 28.h),

              // "Use email & password instead" Button
              GestureDetector(
                onTap: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  } else {
                    Navigator.pushReplacementNamed(context, AppRoutes.login);
                  }
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  child: Text(
                    'Use email & password instead',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 13.5.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}
