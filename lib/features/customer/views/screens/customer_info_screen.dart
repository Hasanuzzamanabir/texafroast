import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:texafrost/core/widgets/custom_app_bar_back.dart';
import 'package:texafrost/routes/app_routes.dart';
import '../../../../core/constants/app_colors.dart';

class CustomerInfoScreen extends StatelessWidget {
  const CustomerInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBarBack(title: 'Customer Info'),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h),

                    // Top Avatar & Title[cite: 20]
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(
                          color: AppColors.lightGrayBorder,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 52.w,
                            height: 52.h,
                            decoration: BoxDecoration(
                              color: AppColors.orangeStart,
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            child: Center(
                              child: Text(
                                'R',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 14.h),
                          Text(
                            'Riverside Office Complex',
                            style: TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Row(
                            children: [
                              ...List.generate(
                                5,
                                (index) => Icon(
                                  Icons.star_rounded,
                                  size: 15.sp,
                                  color: AppColors.orangeStart,
                                ),
                              ),
                              SizedBox(width: 6.w),
                              Text(
                                '4.9 · Returning Customer',
                                style: TextStyle(
                                  color: AppColors.textSecondary,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 18.h),

                    // Contact Info[cite: 20]
                    _buildSectionHeader('CONTACT INFORMATION'),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(
                          color: AppColors.lightGrayBorder,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        children: [
                          _buildContactRow(
                            Icons.phone_outlined,
                            'Phone',
                            '(713) 555-0192',
                          ),
                          Divider(
                            height: 20.h,
                            thickness: 1,
                            color: Colors.white.withOpacity(0.04),
                          ),
                          _buildContactRow(
                            Icons.email_outlined,
                            'Email',
                            'facilities@riversideoffice.com',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 18.h),

                    // Service Address[cite: 20]
                    _buildSectionHeader('SERVICES'),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(
                          color: AppColors.lightGrayBorder,
                          width: 1,
                        ),
                      ),
                      child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () => Navigator.pushNamed(
                            context,
                            AppRoutes.jobDetails,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 4.w,
                                  vertical: 2.h,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.surface,
                                  borderRadius: BorderRadius.circular(10.r),
                                  border: Border.all(
                                    color: AppColors.orangeStart,
                                  ),
                                ),
                                child: Text(
                                  'Assigned',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    color: AppColors.orangeStart,
                                  ),
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                '2847 Commerce Blvd, Suite 400',
                                style: TextStyle(
                                  color: AppColors.textPrimary,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),

                              SizedBox(height: 2.h),
                              Text(
                                'Fix the exhaust fan',
                                style: TextStyle(
                                  color: AppColors.textSecondary,
                                  fontSize: 12.sp,
                                ),
                              ),
                              Text(
                                'Job #J100342',
                                style: TextStyle(
                                  color: AppColors.textSecondary,
                                  fontSize: 12.sp,
                                ),
                              ),
                              Text(
                                '14 days ago',
                                style: TextStyle(
                                  color: AppColors.textSecondary,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        separatorBuilder: (context, index) => Padding(
                          padding: EdgeInsets.symmetric(vertical: 4.h),
                          child: Divider(),
                        ),
                        itemCount: 2,
                      ),
                    ),
                    SizedBox(height: 18.h),

                    // Special Instructions[cite: 20]
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: EdgeInsets.only(left: 4.w, bottom: 8.h),
      child: Text(
        title,
        style: TextStyle(
          color: const Color(0xFF6B7280),
          fontSize: 11.sp,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.8,
        ),
      ),
    );
  }

  Widget _buildContactRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 16.sp, color: const Color(0xFF6B7280)),
        SizedBox(width: 12.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(color: const Color(0xFF6B7280), fontSize: 11.sp),
            ),
            SizedBox(height: 2.h),
            Text(
              value,
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
