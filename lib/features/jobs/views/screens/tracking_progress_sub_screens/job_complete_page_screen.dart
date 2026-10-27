import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:texafrost/core/constants/app_colors.dart';
import 'package:texafrost/core/widgets/custom_app_bar_back.dart';
import 'package:texafrost/core/widgets/custom_button.dart';
import 'package:texafrost/routes/app_routes.dart';

class JobCompletePageScreen extends StatelessWidget {
  const JobCompletePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> completedItems = const [
      {'title': 'Checklist', 'status': '16-point completed'},
      {'title': 'Diagnostics', 'status': 'Readings & findings'},
      {'title': 'Notes', 'status': 'Service notes saved'},
      {'title': 'Photos', 'status': 'Media attached'},
      {'title': 'Parts Used', 'status': 'Materials logged'},
      {'title': 'Signature', 'status': 'Customer signed'},
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBarBack(title: 'Job Complete'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10.h),

              // Success Celebration Icon Badge
              Container(
                width: 76.w,
                height: 76.w,
                decoration: BoxDecoration(
                  color: const Color(0xFF10B981),
                  borderRadius: BorderRadius.circular(22.r),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF10B981).withValues(alpha: 0.25),
                      blurRadius: 18,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.check_rounded,
                  color: Colors.white,
                  size: 44.sp,
                ),
              ),
              SizedBox(height: 18.h),

              // Title
              Text(
                'Job Complete!',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textPrimary,
                  letterSpacing: -0.3,
                ),
              ),
              SizedBox(height: 6.h),

              // Job ID
              Text(
                'JOB-20240901-047',
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textSecondary,
                  letterSpacing: 0.4,
                ),
              ),
              SizedBox(height: 4.h),

              // Customer / Facility Name
              Text(
                'Riverside Office Complex',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textSecondary,
                ),
              ),
              SizedBox(height: 24.h),

              // Summary Checklist Card
              Container(
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(18.r),
                  border: Border.all(color: AppColors.cardBorder, width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.02),
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: completedItems.length,
                  separatorBuilder: (_, _) => Divider(
                    color: AppColors.cardBorder.withValues(alpha: 0.7),
                    height: 1,
                  ),
                  itemBuilder: (context, index) {
                    final item = completedItems[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 13.h),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              item['title']!,
                              style: TextStyle(
                                fontSize: 13.5.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.check_rounded,
                                size: 15.sp,
                                color: const Color(0xFF10B981),
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                item['status']!,
                                style: TextStyle(
                                  fontSize: 12.5.sp,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF10B981),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 28.h),

              // View Service Report Button (Secondary)
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                borderRadius: BorderRadius.circular(14.r),
                child: Container(
                  width: double.infinity,
                  height: 52.h,
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(14.r),
                    border: Border.all(color: AppColors.cardBorder, width: 1.5),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'View Service Report',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 14.5.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12.h),

              // Back to Jobs Button (Primary Orange)
              CustomButtonWidget(
                title: 'Back to Jobs',
                type: ButtonType.orange,
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutes.home,
                    (route) => false,
                  );
                },
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}
