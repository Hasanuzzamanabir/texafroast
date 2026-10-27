import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:texafrost/core/constants/app_colors.dart';

Widget buildAttentionItem({
  required Color color,
  required String title,
  // required String actionLabel,
  required VoidCallback onTap,
}) {
  return Row(
    children: [
      Icon(Icons.emergency_outlined, size: 16.sp, color: color),
      SizedBox(width: 8.w),
      Expanded(
        child: Text(
          title,
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      GestureDetector(
        onTap: onTap,

        child: Icon(
          Icons.keyboard_arrow_right_sharp,
          color: AppColors.textSecondary,
        ),
      ),
    ],
  );
}
