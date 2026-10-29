import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:texafrost/features/customer/views/screens/customer_list_screen.dart';
import 'package:texafrost/features/dashboard/view_models/dashboard_summary_view_model.dart';
import 'package:texafrost/features/dashboard/views/screens/dashboard_home_view.dart';
import 'package:texafrost/features/dashboard/views/widgets/job_card_widget.dart';
import 'package:texafrost/features/messages/views/screens/messages_screen.dart';
import 'package:texafrost/features/schedule/views/screens/schedule_screen.dart';
import 'package:texafrost/routes/app_routes.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/imagepath.dart';
import '../../../../core/widgets/custom_bottom_nav_bar.dart';
import '../../../../core/widgets/secondary_menu_sheet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DashboardProvider>();

    final List<Widget> pages = [
      const DashboardHomeView(),
      const ScheduleScreen(),
      const _JobsView(),
      const CustomerListScreen(),
      const MessagesScreen(),
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: IndexedStack(index: provider.currentIndex, children: pages),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: provider.currentIndex,
        jobsBadgeCount: provider.unreadJobsCount,
        messagesBadgeCount: provider.unreadMessagesCount,
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
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Today\'s Jobs',
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
                      ),
                      SizedBox(width: 8.w),
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
                      children: List.generate(provider.filters.length, (index) {
                        final isSelected =
                            provider.selectedFilterIndex == index;
                        return GestureDetector(
                          onTap: () => provider.selectFilter(index),
                          child: Container(
                            margin: EdgeInsets.only(right: 10.w),
                            padding: EdgeInsets.symmetric(
                              horizontal: 18.w,
                              vertical: 9.h,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? AppColors.orangeStart
                                  : AppColors.surface,
                              borderRadius: BorderRadius.circular(24.r),
                              border: Border.all(
                                color: isSelected
                                    ? AppColors.orangeStart
                                    : AppColors.lightGrayBorder,
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
                      }),
                    ),
                  ),
                  SizedBox(height: 20.h),

                  // Job Cards
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
