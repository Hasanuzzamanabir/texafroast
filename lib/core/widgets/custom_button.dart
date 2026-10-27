import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:texafrost/core/constants/app_colors.dart';

enum ButtonType { orange, blue, green }

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.title,
    this.onTap,
    this.type = ButtonType.orange,
    this.isLoading = false,
    this.height = 56,
    this.borderRadius = 14,
  });

  final String title;
  final VoidCallback? onTap;
  final ButtonType type;
  final bool isLoading;
  final double height;
  final double borderRadius;

  LinearGradient _getGradient() {
    if (onTap == null || isLoading) {
      return AppColors.orangeGradient.withOpacity(0.5);
    }
    switch (type) {
      case ButtonType.blue:
        return AppColors.blueGradient;
      case ButtonType.green:
        return AppColors.greenGradient;
      case ButtonType.orange:
      default:
        return AppColors.orangeGradient;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: isLoading ? null : onTap,
        borderRadius: BorderRadius.circular(borderRadius.r),
        child: Ink(
          width: double.infinity,
          height: height.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius.r),
            gradient: _getGradient(),
          ),
          child: Center(
            child: isLoading
                ? SizedBox(
                    width: 24.w,
                    height: 24.h,
                    child: CircularProgressIndicator(
                      color: AppColors.textPrimary,
                      strokeWidth: 2.5,
                    ),
                  )
                : Text(
                    title,
                    style: TextStyle(
                      color: AppColors.Background,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
