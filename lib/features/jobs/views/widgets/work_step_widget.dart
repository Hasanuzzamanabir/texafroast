import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:texafrost/core/constants/app_colors.dart';

class WorkStepWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final String? title;
  final String? description;
  final IconData? icon;
  final bool isCompleted;
  final Color? iconColor;
  const WorkStepWidget({
    super.key,
    required this.onTap,
    required this.title,
    required this.description,
    required this.icon,
    this.isCompleted = false,
    this.iconColor = AppColors.textPrimary,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isCompleted ? null : onTap,
      child: Stack(
        children: [
          Container(
            width: .maxFinite,
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: AppColors.inputBackground,
              borderRadius: .circular(12.r),
              border: .all(color: AppColors.inputBorder),
            ),
            child: Row(
              spacing: 10.w,
              children: [
                Container(
                  height: 36.h,
                  width: 36.h,
                  padding: .all(8),
                  decoration: BoxDecoration(
                    color: isCompleted
                        ? AppColors.greenEnd
                        : Colors.transparent,
                    shape: BoxShape.rectangle,
                    borderRadius: .circular(10.r),
                    border: .all(color: AppColors.inputBorder),
                  ),
                  child: Icon(
                    isCompleted ? Icons.check : icon,
                    color: isCompleted
                        ? Colors.white
                        : onTap == null
                        ? Colors.grey
                        : iconColor,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        title ?? '',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: .w700,
                          color: isCompleted
                              ? AppColors.textSecondary
                              : onTap == null
                              ? Colors.grey
                              : AppColors.textSecondary,
                        ),
                      ),
                      Text(
                        description ?? '',
                        style: TextStyle(
                          fontSize: 11.sp,
                          fontWeight: .w400,
                          color: isCompleted
                              ? AppColors.labelText
                              : onTap == null
                              ? Colors.grey
                              : AppColors.labelText,
                        ),
                      ),
                    ],
                  ),
                ),
                isCompleted
                    ? Icon(
                        Icons.check_circle_outline,
                        color: AppColors.greenEnd,
                      )
                    : Icon(
                        Icons.keyboard_arrow_right_sharp,
                        color: isCompleted
                            ? AppColors.textSecondary
                            : onTap == null
                            ? Colors.white24
                            : AppColors.textSecondary,
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
