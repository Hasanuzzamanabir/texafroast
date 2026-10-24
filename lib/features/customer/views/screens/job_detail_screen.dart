import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:texafrost/core/widgets/custom_app_bar_back.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/custom_bottom_nav_bar.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../routes/app_routes.dart';
import '../widgets/navigation_action_tile.dart';

class JobDetailScreen extends StatelessWidget {
  const JobDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBarBack(title: 'Job Details'),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h),

                    // Top Info Card[cite: 21]
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: const Color(0xFF131418),
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.06),
                          width: 1,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'JOB-20240901-047',
                                style: TextStyle(
                                  color: AppColors.textSecondary,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8.w,
                                  vertical: 4.h,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF1F222A),
                                  borderRadius: BorderRadius.circular(6.r),
                                ),
                                child: Text(
                                  'ASSIGNED',
                                  style: TextStyle(
                                    color: const Color(0xFF9E9EA7),
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.8,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            'Riverside Office Complex',
                            style: TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(height: 12.h),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10.w,
                                  vertical: 5.h,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF281810),
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Text(
                                  'HIGH PRIORITY',
                                  style: TextStyle(
                                    color: AppColors.orangeStart,
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10.w,
                                  vertical: 5.h,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF1E2129),
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Text(
                                  'Preventive Maintenance',
                                  style: TextStyle(
                                    color: AppColors.textSecondary,
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.h),

                    // Address, Scheduled & Equipment Card[cite: 21]
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: const Color(0xFF131418),
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.06),
                          width: 1,
                        ),
                      ),
                      child: Column(
                        children: [
                          _buildDetailRow(
                            Icons.location_on_outlined,
                            'Address',
                            '2847 Commerce Blvd, Suite 400,\nHouston, TX 77002',
                          ),
                          Divider(
                            height: 24.h,
                            thickness: 1,
                            color: Colors.white.withOpacity(0.04),
                          ),
                          _buildDetailRow(
                            Icons.access_time_rounded,
                            'Scheduled',
                            '8:00 AM · Est. 3 hrs',
                          ),
                          Divider(
                            height: 24.h,
                            thickness: 1,
                            color: Colors.white.withOpacity(0.04),
                          ),
                          _buildDetailRow(
                            Icons.build_outlined,
                            'Equipment',
                            'Carrier Rooftop Unit (RTU)',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),

                    // Actions List[cite: 21]
                    NavigationActionTile(
                      title: 'Customer Info',
                      onTap: () =>
                          Navigator.pushNamed(context, AppRoutes.customerInfo),
                    ),
                    NavigationActionTile(
                      title: 'Equipment Details',
                      onTap: () =>
                          Navigator.pushNamed(context, AppRoutes.equipment),
                    ),
                    NavigationActionTile(
                      title: 'Service History',
                      onTap: () =>
                          Navigator.pushNamed(context, AppRoutes.serviceHistory),
                    ),

                    SizedBox(height: 12.h),

                    // Start Navigation Button[cite: 21]
                    CustomButtonWidget(
                      title: 'Start Navigation',
                      type: ButtonType.orange,
                      onTap: () {},
                    ),
                    SizedBox(height: 8.h),
                    Center(
                      child: Text(
                        'Begin driving to customer',
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 1, // Schedule Tab Active[cite: 21]
        jobsBadgeCount: 3,
        onTap: (index) => Navigator.pop(context),
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 18.sp, color: const Color(0xFF6B7280)),
        SizedBox(width: 14.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: const Color(0xFF6B7280),
                  fontSize: 11.sp,
                ),
              ),
              SizedBox(height: 3.h),
              Text(
                value,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  height: 1.3,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}