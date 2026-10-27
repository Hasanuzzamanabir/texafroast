import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:texafrost/features/dashboard/views/widgets/attention_item_widget.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/imagepath.dart';
import '../../../../core/widgets/offline_status_bar.dart';
import '../../../../core/widgets/secondary_menu_sheet.dart';
import '../../../../routes/app_routes.dart';
import '../../models/dashboard_summary_model.dart';
import '../widgets/job_card_widget.dart';

class DashboardHomeView extends StatelessWidget {
  const DashboardHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DashboardProvider>();

    return SafeArea(
      child: Column(
        children: [
          // 1. Top App Bar: Logo, Notification, and Technician Profile Avatar
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  ImagePath.appLogoImage,
                  width: 115.w,
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) => Text(
                    'Texafrost',
                    style: TextStyle(
                      color: AppColors.orangeStart,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Row(
                  children: [
                    // Notifications
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: 38.w,
                          height: 38.h,
                          decoration: BoxDecoration(
                            color: AppColors.surface,
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                              color: AppColors.lightGrayBorder,
                            ),
                          ),
                          child: Icon(
                            Icons.notifications_outlined,
                            color: AppColors.orangeStart,
                            size: 20.sp,
                          ),
                        ),
                        if (provider.unreadJobsCount > 0)
                          Positioned(
                            top: -4.h,
                            right: -4.w,
                            child: Container(
                              padding: EdgeInsets.all(4.w),
                              decoration: BoxDecoration(
                                color: AppColors.redStart,
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                '${provider.unreadJobsCount}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.bold,
                                  height: 1,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    SizedBox(width: 10.w),
                    // Technician Profile Avatar (Opens Organized Menu)
                    GestureDetector(
                      onTap: () => SecondaryMenuSheet.show(context),
                      child: CircleAvatar(
                        radius: 19.r,
                        backgroundColor: AppColors.orangeStart,
                        child: Text(
                          'TH',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // 2. Clear Sync Status Bar with Retry Option
          const SyncStatusBar(),

          // 3. Scrollable Field Technician Home Content
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // // A. Technician Time Tracking Card (Clock In / Clock Out)
                  // _buildTimeTrackingCard(context, provider),
                  // SizedBox(height: 14.h),

                  // B. "Needs Attention" Field Alert Section
                  _buildNeedsAttentionSection(context),
                  SizedBox(height: 14.h),

                  // C. Technician Active Job Status Card
                  _buildCurrentJobStatusCard(context, provider),
                  SizedBox(height: 18.h),

                  // E. Today's Upcoming Work & Appointments
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Today's Schedule",
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      TextButton(
                        onPressed: () =>
                            provider.changeTab(1), // Go to Schedule tab
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          'View All →',
                          style: TextStyle(
                            color: AppColors.orangeStart,
                            fontSize: 12.5.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),

                  ...provider.jobs.map(
                    (job) => JobCardWidget(
                      job: job,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.viewJob,
                          arguments: job.id,
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- Widget Builders ---

  Widget _buildNeedsAttentionSection(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColors.orangeLight,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.orangeBorder, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.warning_amber_rounded,
                color: AppColors.orangeEnd,
                size: 18.sp,
              ),
              SizedBox(width: 6.w),
              Text(
                'NEEDS ATTENTION',
                style: TextStyle(
                  color: AppColors.orangeEnd,
                  fontSize: 11.5.sp,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.5,
                ),
              ),
              const Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: AppColors.orangeEnd,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Text(
                  '2 Items',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          buildAttentionItem(
            color: AppColors.redStart,
            title: 'Emergency repair at Sunview Medical Center (11:30 AM)',

            onTap: () => Navigator.pushNamed(context, AppRoutes.jobDetails),
          ),
          Divider(color: AppColors.orangeBorder.withOpacity(0.5), height: 12.h),
          buildAttentionItem(
            color: AppColors.orangeEnd,
            title: '1 pending estimate awaiting customer approval',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  // Widget _buildTimeTrackingCard(
  //   BuildContext context,
  //   DashboardProvider provider,
  // ) {
  //   return Container(
  //     width: double.infinity,
  //     padding: EdgeInsets.all(14.w),
  //     decoration: BoxDecoration(
  //       color: AppColors.surface,
  //       borderRadius: BorderRadius.circular(14.r),
  //       border: Border.all(color: AppColors.lightGrayBorder),
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.black.withOpacity(0.02),
  //           blurRadius: 8,
  //           offset: const Offset(0, 2),
  //         ),
  //       ],
  //     ),
  //     child: Row(
  //       children: [
  //         Container(
  //           padding: EdgeInsets.all(10.w),
  //           decoration: BoxDecoration(
  //             color: provider.isClockedIn
  //                 ? AppColors.greenLight
  //                 : AppColors.surfaceLight,
  //             borderRadius: BorderRadius.circular(12.r),
  //             border: Border.all(
  //               color: provider.isClockedIn
  //                   ? AppColors.greenStart
  //                   : AppColors.lightGrayBorder,
  //             ),
  //           ),
  //           child: Icon(
  //             Icons.timer_outlined,
  //             color: provider.isClockedIn
  //                 ? AppColors.greenStart
  //                 : AppColors.textSecondary,
  //             size: 24.sp,
  //           ),
  //         ),
  //         SizedBox(width: 12.w),
  //         Expanded(
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Row(
  //                 children: [
  //                   Container(
  //                     width: 7.r,
  //                     height: 7.r,
  //                     decoration: BoxDecoration(
  //                       shape: BoxShape.circle,
  //                       color: provider.isClockedIn
  //                           ? AppColors.greenStart
  //                           : AppColors.textMuted,
  //                     ),
  //                   ),
  //                   SizedBox(width: 5.w),
  //                   Text(
  //                     provider.isClockedIn ? 'CLOCKED IN' : 'CLOCKED OUT',
  //                     style: TextStyle(
  //                       color: provider.isClockedIn
  //                           ? AppColors.greenStart
  //                           : AppColors.textSecondary,
  //                       fontSize: 11.sp,
  //                       fontWeight: FontWeight.w800,
  //                       letterSpacing: 0.5,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               SizedBox(height: 2.h),
  //               Text(
  //                 provider.isClockedIn
  //                     ? '${provider.hoursWorkedToday} logged today (Started ${provider.clockInTime})'
  //                     : 'Not currently recording work time',
  //                 style: TextStyle(
  //                   color: AppColors.textSecondary,
  //                   fontSize: 11.5.sp,
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //         SizedBox(width: 8.w),
  //         GestureDetector(
  //           onTap: () => provider.toggleClockIn(),
  //           child: Container(
  //             padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 7.h),
  //             decoration: BoxDecoration(
  //               color: provider.isClockedIn
  //                   ? AppColors.surfaceLight
  //                   : AppColors.orangeStart,
  //               borderRadius: BorderRadius.circular(8.r),
  //               border: Border.all(
  //                 color: provider.isClockedIn
  //                     ? AppColors.lightGrayBorder
  //                     : AppColors.orangeStart,
  //               ),
  //             ),
  //             child: Text(
  //               provider.isClockedIn ? 'Clock Out' : 'Clock In',
  //               style: TextStyle(
  //                 color: provider.isClockedIn
  //                     ? AppColors.textPrimary
  //                     : Colors.white,
  //                 fontSize: 11.5.sp,
  //                 fontWeight: FontWeight.w700,
  //               ),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildCurrentJobStatusCard(
    BuildContext context,
    DashboardProvider provider,
  ) {
    final activeJob = provider.activeJob;
    if (activeJob == null) return const SizedBox.shrink();

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(
          color: AppColors.orangeStart.withOpacity(0.35),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.orangeStart.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: AppColors.orangeStart,
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Text(
                  'CURRENT ACTIVE JOB',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              Text(
                'Started 8:30 AM',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Text(
            activeJob.title,
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 16.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 4.h),
          Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                size: 14.sp,
                color: AppColors.textSecondary,
              ),
              SizedBox(width: 4.w),
              Expanded(
                child: Text(
                  activeJob.address,
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12.sp,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.trackingProgress);
                  },
                  icon: const Icon(
                    Icons.play_arrow_rounded,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'Continue Job',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.orangeStart,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              IconButton.outlined(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.viewJob);
                },
                icon: const Icon(Icons.navigation_outlined),
                color: AppColors.orangeStart,
                style: IconButton.styleFrom(
                  side: BorderSide(color: AppColors.orangeStart),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
