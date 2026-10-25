import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:texafrost/core/constants/app_colors.dart';

Widget diagnosisCardWidget() {
  return Container(
    padding: .all(14.r),
    width: .maxFinite,
    decoration: BoxDecoration(
      color: AppColors.inputBackground,
      borderRadius: .circular(16.r),
    ),
    child: Column(
      crossAxisAlignment: .start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.orangeStart.withValues(alpha: .1),
            borderRadius: .all(.circular(6.r)),
          ),
          padding: EdgeInsets.all(8.r),
          child: Text(
            'MEDIUM',
            style: TextStyle(
              color: AppColors.orangeStart,
              fontWeight: .w700,
              fontSize: 10.sp,
            ),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          'Run capacitor reading 44.2 MFD (rated 45 MFD) — within tolerance but aging.',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: .w500,
            color: AppColors.textPrimary,
          ),
        ),
        Divider(),
        Text(
          '✓ Documented. Recommend replacement on next scheduled maintenance.',
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: .w400,
            color: AppColors.labelText,
          ),
        ),
      ],
    ),
  );
}
