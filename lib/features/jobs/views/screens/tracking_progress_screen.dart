import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:texafrost/core/constants/app_colors.dart';
import 'package:texafrost/core/widgets/custom_app_bar_back.dart';
import 'package:texafrost/features/jobs/view_models/job_tracking_view_model.dart';
import 'package:texafrost/features/jobs/views/widgets/work_step_widget.dart';
import 'package:texafrost/routes/app_routes.dart';

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
                    Consumer<JobTrackingViewModel>(
                      builder: (context, provider, child) =>
                          LinearProgressIndicator(
                            value: provider.completedStepsCount / 6,
                            borderRadius: .circular(12.r),
                            color: AppColors.orangeEnd,
                            minHeight: 6.h,
                          ),
                    ),
                    SizedBox(height: 10.h),
                    Consumer<JobTrackingViewModel>(
                      builder: (context, provider, child) => Text(
                        '${provider.completedStepsCount}/6 steps completed',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: .w500,
                          color: AppColors.labelText,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32.h),
              Consumer<JobTrackingViewModel>(
                builder: (context, provider, child) => Column(
                  crossAxisAlignment: .start,
                  children: [
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
                      isCompleted: provider.completedSteps[0],
                      description: '16-point service checklist',
                      icon: Icons.check,
                      title: 'Checklist',
                      onTap: provider.eligibleStep == 0
                          ? () {
                              Navigator.pushNamed(context, AppRoutes.checklist);
                            }
                          : null,
                    ),
                    SizedBox(height: 8.h),
                    WorkStepWidget(
                      isCompleted: provider.completedSteps[1],
                      description: 'Readings, findings & actions',
                      icon: Icons.query_stats,
                      title: 'Diagnostic Findings',
                      onTap: provider.eligibleStep == 1
                          ? () {
                              Navigator.pushNamed(
                                context,
                                AppRoutes.diagnostic,
                              );
                            }
                          : null,
                    ),
                    SizedBox(height: 8.h),
                    WorkStepWidget(
                      isCompleted: provider.completedSteps[2],
                      description: 'Technician & customer notes',
                      icon: Icons.edit_note,
                      title: 'Notes',
                      onTap: provider.eligibleStep == 2
                          ? () {
                              Navigator.pushNamed(context, AppRoutes.notes);
                            }
                          : null,
                    ),
                    SizedBox(height: 8.h),
                    WorkStepWidget(
                      isCompleted: provider.completedSteps[3],
                      description: 'Before, after & evidence',
                      icon: Icons.photo_camera_outlined,
                      title: 'Photo / Videos',
                      onTap: provider.eligibleStep == 3
                          ? () {
                              Navigator.pushNamed(
                                context,
                                AppRoutes.photoAndVideo,
                              );
                            }
                          : null,
                    ),
                    SizedBox(height: 8.h),
                    WorkStepWidget(
                      isCompleted: provider.completedSteps[4],
                      description: 'Parts used & quantities',
                      icon: Icons.settings,
                      title: 'Parts & Materials',
                      onTap: provider.eligibleStep == 4
                          ? () {
                              Navigator.pushNamed(
                                context,
                                AppRoutes.partsAndMaterials,
                              );
                            }
                          : null,
                    ),
                    SizedBox(height: 8.h),
                    WorkStepWidget(
                      isCompleted: provider.completedSteps[5],
                      description: 'Sign-off & authorization',
                      icon: Icons.draw,
                      title: 'Customer Signature',
                      onTap: provider.eligibleStep == 5
                          ? () {
                              Navigator.pushNamed(
                                context,
                                AppRoutes.customerSignature,
                              );
                            }
                          : null,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50.h),
            ],
          ),
        ),
      ),
    );
  }
}
