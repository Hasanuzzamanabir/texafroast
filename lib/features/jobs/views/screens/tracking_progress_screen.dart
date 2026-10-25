import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:texafrost/core/constants/app_colors.dart';
import 'package:texafrost/core/widgets/custom_app_bar_back.dart';

class TrackingProgressScreen extends StatelessWidget {
  const TrackingProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarBack(title: 'In Progress'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 17.w),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Divider(thickness: 1, color: AppColors.inputBorder),
              SizedBox(height: 16.h),
              Container(
                width: .maxFinite,
                padding: EdgeInsets.all(20.r),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.orangeStart.withValues(alpha: .2),
                      AppColors.greenEnd.withValues(alpha: .1),
                    ],
                  ),
                  border: .all(color: AppColors.orangeStart),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Column(
                  children: [
                    Text(
                      'ACTIVE TIMER',
                      style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: .w700,
                        color: AppColors.orangeEnd,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      '00:00',
                      style: TextStyle(
                        fontSize: 52.sp,
                        fontWeight: .w900,
                        color: AppColors.orangeEnd,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.textPrimary,
                          fontWeight: .w400,
                        ),
                        text: 'Riverside Office Complex',
                        children: [
                          TextSpan(
                            text: ' · ',
                            children: [
                              TextSpan(text: 'Preventive Maintenance'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 14.h),
                    LinearProgressIndicator(
                      value: .4,
                      borderRadius: .circular(12.r),
                      color: AppColors.orangeEnd,
                      minHeight: 6.h,
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      '1/6 steps completed',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: .w500,
                        color: AppColors.labelText,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32.h),
              Text(
                'WORK STEPS',
                style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: .w700,
                  color: AppColors.labelText,
                ),
              ),
              SizedBox(height: 8.h),
              WorkStepWidget(
                description: '16-point service checklist',
                icon: Icons.check,
                title: 'Checklist',
                onTap: () {},
              ),
              SizedBox(height: 8.h),
              WorkStepWidget(
                description: 'Readings, findings & actions',
                icon: Icons.query_stats,
                title: 'Diagnostic Findings',
                onTap: () {},
              ),
              SizedBox(height: 8.h),
              WorkStepWidget(
                description: 'Technician & customer notes',
                icon: Icons.edit_note,
                title: 'Notes',
                onTap: () {},
              ),
              SizedBox(height: 8.h),
              WorkStepWidget(
                description: 'Before, after & evidence',
                icon: Icons.photo_camera_outlined,
                title: 'Photo / Videos',
                onTap: () {},
              ),
              SizedBox(height: 8.h),
              WorkStepWidget(
                description: 'Parts used & quantities',
                icon: Icons.settings,
                title: 'Parts & Materials',
                onTap: () {},
              ),
              SizedBox(height: 8.h),
              WorkStepWidget(
                description: 'Sign-off & authorization',
                icon: Icons.draw,
                title: 'Customer Signature',
                onTap: () {},
              ),
              SizedBox(height: 50.h),
            ],
          ),
        ),
      ),
    );
  }
}

class WorkStepWidget extends StatelessWidget {
  VoidCallback? onTap;
  final String? title;
  final String? description;
  final IconData? icon;
  final bool isCompleted;
  final Color? iconColor;
  WorkStepWidget({
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
    return Container(
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
              color: isCompleted ? AppColors.greenEnd : Colors.transparent,
              shape: BoxShape.rectangle,
              borderRadius: .circular(10.r),
              border: .all(color: AppColors.inputBorder),
            ),
            child: Icon(
              isCompleted ? Icons.check : icon,
              color: isCompleted ? Colors.white : iconColor,
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
                    color: Colors.white,
                  ),
                ),
                Text(
                  description ?? '',
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: .w400,
                    color: AppColors.labelText,
                  ),
                ),
              ],
            ),
          ),
          isCompleted
              ? Icon(Icons.check_circle_outline, color: AppColors.greenEnd)
              : Icon(Icons.keyboard_arrow_right_sharp, color: Colors.white),
        ],
      ),
    );
  }
}
