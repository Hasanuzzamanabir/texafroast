import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:texafrost/features/dashboard/models/dashboard_summary_model.dart';
import 'package:texafrost/features/dashboard/views/widgets/job_card_widget.dart';
import 'package:texafrost/features/profile/views/screens/profile_screen.dart';
import 'package:texafrost/features/schedule/views/screens/schedule_screen.dart';
import 'package:texafrost/features/sync_queue/views/screens/offline_queue_screen.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/imagepath.dart';
import '../../../../core/widgets/custom_bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DashboardProvider>();

    final List<Widget> pages = [
      const _JobsView(),                 
      const ScheduleScreen(),  
      const OfflineQueueContentView(),                               
     const ProfileScreen(),                                
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: IndexedStack(
        index: provider.currentIndex,
        children: pages,
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: provider.currentIndex,
        jobsBadgeCount: provider.unreadJobsCount,
        onTap: (index) {
          provider.changeTab(index);
        },
      ),
    );
  }
}

class _JobsView extends StatelessWidget {
  const _JobsView();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DashboardProvider>();

    return SafeArea(
      child: Column(
        children: [
          // 1. Top Bar: Logo, Notification, Avatar
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  ImagePath.appLogoImage,
                  width: 125.w,
                  fit: BoxFit.contain,
                ),
                Row(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: 38.w,
                          height: 38.h,
                          decoration: BoxDecoration(
                            color: const Color(0xFF1A1C22),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Icon(
                            Icons.notifications_outlined,
                            color: AppColors.orangeStart,
                            size: 20.sp,
                          ),
                        ),
                        Positioned(
                          top: -4.h,
                          right: -4.w,
                          child: Container(
                            padding: EdgeInsets.all(4.w),
                            decoration: const BoxDecoration(
                              color: Color(0xFFEF4444),
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
                    Container(
                      width: 38.w,
                      height: 38.h,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.orangeStart,
                      ),
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 24.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // 2. Jobs List Section
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'My Jobs',
                            style: TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            'Tuesday, September 2, 2026',
                            style: TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '${provider.assignedTodayCount}',
                            style: TextStyle(
                              color: AppColors.orangeStart,
                              fontSize: 26.sp,
                              fontWeight: FontWeight.w900,
                              height: 1,
                            ),
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            'ASSIGNED TODAY',
                            style: TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 18.h),

                  // Filter Chips
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        provider.filters.length,
                        (index) {
                          final isSelected =
                              provider.selectedFilterIndex == index;
                          return GestureDetector(
                            onTap: () => provider.selectFilter(index),
                            child: Container(
                              margin: EdgeInsets.only(right: 10.w),
                              padding: EdgeInsets.symmetric(
                                horizontal: 18.w,
                                vertical: 10.h,
                              ),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? AppColors.orangeStart
                                    : const Color(0xFF1E2129),
                                borderRadius: BorderRadius.circular(24.r),
                                border: isSelected
                                    ? null
                                    : Border.all(
                                        color: Colors.white.withOpacity(0.06),
                                        width: 1,
                                      ),
                              ),
                              child: Text(
                                provider.filters[index],
                                style: TextStyle(
                                  color: isSelected
                                      ? Colors.white
                                      : AppColors.textSecondary,
                                  fontSize: 13.sp,
                                  fontWeight: isSelected
                                      ? FontWeight.w700
                                      : FontWeight.w500,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),

                  // Job Cards
                  ...provider.jobs.map(
                    (job) => JobCardWidget(
                      job: job,
                      onTap: () {},
                    ),
                  ),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}