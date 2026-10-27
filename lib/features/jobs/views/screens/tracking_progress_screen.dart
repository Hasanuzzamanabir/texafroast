import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:texafrost/core/constants/app_colors.dart';
import 'package:texafrost/core/widgets/custom_app_bar_back.dart';
import 'package:texafrost/core/widgets/custom_button.dart';
import 'package:texafrost/features/jobs/view_models/job_tracking_view_model.dart';
import 'package:texafrost/features/jobs/views/widgets/work_step_widget.dart';
import 'package:texafrost/routes/app_routes.dart';

class TrackingProgressScreen extends StatelessWidget {
  const TrackingProgressScreen({super.key});

  Future<void> _showClockOutConfirmDialog(BuildContext context) async {
    final bool? shouldLeave = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        title: Row(
          children: [
            Icon(
              Icons.warning_amber_rounded,
              color: AppColors.orangeStart,
              size: 24.sp,
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Text(
                'Clock Out & Leave?',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          ],
        ),
        content: Text(
          'You are currently clocked in to this active job session. Leaving this screen will pause your active timer and clock you out.',
          style: TextStyle(
            fontSize: 13.sp,
            color: AppColors.textSecondary,
            height: 1.4,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(
              'Stay on Job',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.orangeStart,
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Clock Out & Leave'),
          ),
        ],
      ),
    );

    if (shouldLeave == true && context.mounted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) {
          _showClockOutConfirmDialog(context);
        }
      },
      child: Scaffold(
        appBar: CustomAppBarBack(
          title: 'In Progress',
          onBack: () => _showClockOutConfirmDialog(context),
        ),
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
                            backgroundColor: Colors.white,
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
                    SizedBox(height: 12.h),
                    InkWell(
                      onTap: () => _showClockOutConfirmDialog(context),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 8.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(color: AppColors.inputBorder),
                        ),
                        child: Row(
                          mainAxisSize: .min,
                          spacing: 6.w,
                          children: [
                            Icon(
                              Icons.watch_later_outlined,
                              color: AppColors.orangeEnd,
                              size: 18.sp,
                            ),
                            Text(
                              'Clock out',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: .w500,
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ],
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
                    SizedBox(height: 24.h),
                    if (provider.completedStepsCount != 6)
                      Center(
                        child: Text(
                          'Complete all steps to generate the service report',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: .w400,
                            color: AppColors.labelText,
                          ),
                        ),
                      )
                    else
                      CustomButtonWidget(
                        title: 'Generate Service Report',
                        type: ButtonType.orange,
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.jobReport);
                        },
                      ),
                  ],
                ),
              ),
              SizedBox(height: 50.h),
            ],
          ),
        ),
      ),
    ),
  );
}
}
