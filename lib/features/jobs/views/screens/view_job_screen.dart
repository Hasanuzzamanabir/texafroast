import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:texafrost/core/constants/app_colors.dart';
import 'package:texafrost/core/widgets/custom_app_bar_back.dart';
import 'package:texafrost/core/widgets/custom_button.dart';
import 'package:texafrost/routes/app_routes.dart';

class ViewJobScreen extends StatelessWidget {
  final String? jobID;
  const ViewJobScreen({super.key, this.jobID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarBack(title: 'Details'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 17.0.w),
          child: Column(
            children: [
              SizedBox(height: 17.h),
              Container(
                width: .maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: AppColors.blueGlow, width: 1),
                ),
                child: Column(
                  children: [
                    Container(
                      width: .maxFinite,
                      height: 200.h,
                      decoration: BoxDecoration(
                        color: AppColors.surfaceLight,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Icon(
                        Icons.map_outlined,
                        color: AppColors.orangeStart,
                        size: 40.sp,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(14.0.w),
                      child: Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Text(
                            'Tap to open full navigation',
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.blueGlow,
                            ),
                          ),
                          Text(
                            '13 min',
                            style: TextStyle(
                              fontSize: 22.sp,
                              fontWeight: .w900,
                              color: AppColors.orangeEnd,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              Container(
                width: .maxFinite,
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  color: AppColors.inputBackground,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: AppColors.inputBorder, width: 1),
                ),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      'DESTINATION',
                      style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.labelText,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'Riverside Office Complex',
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: .w800,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      '2847 Commerce Blvd, Suite 400, Houston, TX 77002',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: .w400,
                        color: AppColors.labelText,
                      ),
                    ),
                    SizedBox(height: 14.h),
                    Row(
                      spacing: 10,
                      children: [
                        Flexible(
                          child: FilledButton(
                            style: FilledButton.styleFrom(
                              backgroundColor: Color(
                                0xff3B82F6,
                              ).withValues(alpha: .2),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                side: BorderSide(color: AppColors.blueStart),
                              ),
                            ),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: .center,
                              children: [
                                Icon(
                                  Icons.navigation_outlined,
                                  color: const Color(0xff3B82F6),
                                ),
                                SizedBox(width: 4.w),
                                Text(
                                  'Navigate',
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: .w700,
                                    color: const Color(0xff3B82F6),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Flexible(
                          child: FilledButton(
                            style: FilledButton.styleFrom(
                              backgroundColor: AppColors.inputBackground,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                side: BorderSide(color: AppColors.inputBorder),
                              ),
                            ),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: .center,
                              children: [
                                Icon(
                                  Icons.call,
                                  color: AppColors.textSecondary,
                                ),
                                SizedBox(width: 4.w),
                                Text(
                                  'Call',
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: .w700,
                                    color: AppColors.textSecondary,
                                    // color: const Color(0xff3B82F6),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              Container(
                width: .maxFinite,
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: AppColors.inputBackground,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: AppColors.inputBorder, width: 1),
                ),
                child: Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    _buildStatCard(title: 'Distance', value: '3.2 mi'),
                    _buildStatCard(title: 'ETA', value: '13 min'),
                    _buildStatCard(title: 'Arriving in', value: '10:29 AM'),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              CustomButtonWidget(
                title: 'I\'ve Arrived at Location ✓',
                onTap: () => Navigator.pushNamed(context, AppRoutes.arrivedJob),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard({required String title, required String value}) {
    return Column(
      crossAxisAlignment: .center,
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w800,
            color: AppColors.textPrimary,
          ),
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 8.sp,
            fontWeight: .w400,
            color: AppColors.labelText,
          ),
        ),
      ],
    );
  }
}
