import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:texafrost/core/widgets/custom_app_bar_back.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../routes/app_routes.dart';
import '../widgets/navigation_action_tile.dart';

class JobDetailScreen extends StatelessWidget {
  final String? jobId;
  const JobDetailScreen({super.key, this.jobId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomAppBarBack(title: 'Job Details'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Top Job Info Card
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: AppColors.lightGrayBorder),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.02),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          jobId ?? 'JOB-20240901-047',
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.8,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.orangeLight,
                            borderRadius: BorderRadius.circular(6.r),
                            border: Border.all(color: AppColors.orangeBorder),
                          ),
                          child: Text(
                            'ASSIGNED',
                            style: TextStyle(
                              color: AppColors.orangeEnd,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 0.8,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Riverside Office Complex',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 9.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.redLight,
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          child: Text(
                            'HIGH PRIORITY',
                            style: TextStyle(
                              color: AppColors.redStart,
                              fontSize: 10.5.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 9.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.surfaceLight,
                            borderRadius: BorderRadius.circular(6.r),
                            border: Border.all(
                              color: AppColors.lightGrayBorder,
                            ),
                          ),
                          child: Text(
                            'Preventive Maintenance',
                            style: TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 10.5.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.h),

              // 2. Customer Contact & Quick Actions (Call & Navigate)
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: AppColors.lightGrayBorder),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.02),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'CUSTOMER CONTACT & LOCATION',
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 10.5.sp,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.6,
                          ),
                        ),
                        Text(
                          'Suite 400',
                          style: TextStyle(
                            color: AppColors.orangeEnd,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Marcus Vance (Property Manager)',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 3.h),
                    Text(
                      '2847 Commerce Blvd, Suite 400, Houston, TX 77002',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 12.5.sp,
                        height: 1.3,
                      ),
                    ),
                    SizedBox(height: 14.h),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              Navigator.pushNamed(context, AppRoutes.viewJob);
                            },
                            icon: const Icon(
                              Icons.navigation_outlined,
                              size: 18,
                            ),
                            label: const Text('Directions'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.blueStart,
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {},
                            icon: Icon(
                              Icons.phone_outlined,
                              size: 18,
                              color: AppColors.orangeStart,
                            ),
                            label: Text(
                              'Call Customer',
                              style: TextStyle(
                                color: AppColors.orangeStart,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: AppColors.orangeStart),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.h),

              // 3. Appointment Window & Assigned Technicians
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: AppColors.lightGrayBorder),
                ),
                child: Column(
                  children: [
                    _buildDetailRow(
                      Icons.access_time_rounded,
                      'Appointment Window',
                      'Today 8:00 AM – 10:00 AM (Est. 3 hrs)',
                    ),
                    Divider(height: 20.h, color: AppColors.lightGrayBorder),
                    _buildDetailRow(
                      Icons.person_outline_rounded,
                      'Assigned Technicians',
                      'Tom Harrison (Lead Tech) · Alex Rivera (Associate)',
                    ),
                    Divider(height: 20.h, color: AppColors.lightGrayBorder),
                    _buildDetailRow(
                      Icons.hvac_rounded,
                      'Target Equipment',
                      'Carrier RTU 50TC - 12.5 Ton Rooftop Package Unit',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),

              // 4. Primary Lifecycle Action Stepper
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(14.w),
                decoration: BoxDecoration(
                  color: AppColors.orangeLight,
                  borderRadius: BorderRadius.circular(14.r),
                  border: Border.all(color: AppColors.orangeBorder),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildWorkflowStep('1. Travel', true, true),
                        _buildWorkflowArrow(),
                        _buildWorkflowStep('2. Arrive', false, false),
                        _buildWorkflowArrow(),
                        _buildWorkflowStep('3. Work', false, false),
                        _buildWorkflowArrow(),
                        _buildWorkflowStep('4. Finish', false, false),
                      ],
                    ),
                    SizedBox(height: 14.h),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigate to Traveling / View Job
                          Navigator.pushNamed(context, AppRoutes.viewJob);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.orangeStart,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          padding: EdgeInsets.symmetric(vertical: 13.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        child: Text(
                          'Start Travel (En Route) ➔',
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 18.h),

              // // 5. Work Execution, Checklists & Media
              // Text(
              //   'WORK EXECUTION & TASKS',
              //   style: TextStyle(
              //     color: AppColors.textSecondary,
              //     fontSize: 11.sp,
              //     fontWeight: FontWeight.w800,
              //     letterSpacing: 0.8,
              //   ),
              // ),
              // SizedBox(height: 8.h),
              // NavigationActionTile(
              //   title: 'Checklist & Tasks (0/6 completed)',
              //   onTap: () => Navigator.pushNamed(context, AppRoutes.checklist),
              // ),
              // NavigationActionTile(
              //   title: 'Diagnostic & Field Notes',
              //   onTap: () => Navigator.pushNamed(context, AppRoutes.notes),
              // ),
              // NavigationActionTile(
              //   title: 'Photos, Videos & Media Attachments',
              //   onTap: () => Navigator.pushNamed(context, AppRoutes.photoAndVideo),
              // ),
              // NavigationActionTile(
              //   title: 'Parts & Materials Used',
              //   onTap: () => Navigator.pushNamed(context, AppRoutes.partsAndMaterials),
              // ),
              // NavigationActionTile(
              //   title: 'Customer Signature & Sign-Off',
              //   onTap: () => Navigator.pushNamed(context, AppRoutes.customerSignature),
              // ),

              // SizedBox(height: 14.h),

              // // 6. Assets & Work Orders (Equipment, History, Work Orders)
              // Text(
              //   'EQUIPMENT & SERVICE HISTORY',
              //   style: TextStyle(
              //     color: AppColors.textSecondary,
              //     fontSize: 11.sp,
              //     fontWeight: FontWeight.w800,
              //     letterSpacing: 0.8,
              //   ),
              // ),
              // SizedBox(height: 8.h),
              // NavigationActionTile(
              //   title: 'Equipment Details & Specs',
              //   onTap: () => Navigator.pushNamed(context, AppRoutes.equipment),
              // ),
              // NavigationActionTile(
              //   title: 'Service & Maintenance History',
              //   onTap: () => Navigator.pushNamed(context, AppRoutes.serviceHistory),
              // ),
              // NavigationActionTile(
              //   title: 'Work Order & Estimate Summary',
              //   onTap: () {},
              // ),
              // SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWorkflowStep(String label, bool isCurrent, bool isCompleted) {
    return Column(
      children: [
        CircleAvatar(
          radius: 12.r,
          backgroundColor: isCurrent
              ? AppColors.orangeStart
              : (isCompleted ? AppColors.greenStart : AppColors.surface),
          child: Icon(
            isCompleted ? Icons.check : Icons.circle,
            size: 10.sp,
            color: isCurrent || isCompleted
                ? Colors.white
                : AppColors.textMuted,
          ),
        ),
        SizedBox(height: 3.h),
        Text(
          label,
          style: TextStyle(
            color: isCurrent ? AppColors.orangeEnd : AppColors.textSecondary,
            fontSize: 10.sp,
            fontWeight: isCurrent ? FontWeight.w800 : FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildWorkflowArrow() {
    return Icon(
      Icons.chevron_right_rounded,
      color: AppColors.orangeBorder,
      size: 16.sp,
    );
  }

  Widget _buildDetailRow(IconData icon, String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 18.sp, color: AppColors.orangeStart),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                value,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 13.5.sp,
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
