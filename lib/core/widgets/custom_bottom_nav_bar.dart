import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    this.jobsBadgeCount = 0,
    this.messagesBadgeCount = 0,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;
  final int jobsBadgeCount;
  final int messagesBadgeCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border(
          top: BorderSide(
            color: AppColors.lightGrayBorder,
            width: 1,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 64.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                index: 0,
                label: 'Home',
                activeIcon: Icons.home_rounded,
                inactiveIcon: Icons.home_outlined,
              ),
              _buildNavItem(
                index: 1,
                label: 'Schedule',
                activeIcon: Icons.calendar_month_rounded,
                inactiveIcon: Icons.calendar_month_outlined,
              ),
              _buildNavItem(
                index: 2,
                label: 'Jobs',
                activeIcon: Icons.assignment_rounded,
                inactiveIcon: Icons.assignment_outlined,
                badgeCount: jobsBadgeCount,
              ),
              _buildNavItem(
                index: 3,
                label: 'Customers',
                activeIcon: Icons.people_alt_rounded,
                inactiveIcon: Icons.people_alt_outlined,
              ),
              _buildNavItem(
                index: 4,
                label: 'Messages',
                activeIcon: Icons.chat_bubble_rounded,
                inactiveIcon: Icons.chat_bubble_outline_rounded,
                badgeCount: messagesBadgeCount,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required String label,
    required IconData activeIcon,
    required IconData inactiveIcon,
    int badgeCount = 0,
  }) {
    final bool isSelected = currentIndex == index;
    final Color itemColor =
        isSelected ? AppColors.orangeStart : AppColors.textSecondary;

    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => onTap(index),
          splashColor: AppColors.orangeStart.withValues(alpha: 0.12),
          highlightColor: AppColors.orangeStart.withValues(alpha: 0.06),
          child: SizedBox(
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Icon(
                      isSelected ? activeIcon : inactiveIcon,
                      size: 23.sp,
                      color: itemColor,
                    ),
                    if (badgeCount > 0)
                      Positioned(
                        top: -4.h,
                        right: -7.w,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 4.w,
                            vertical: 1.h,
                          ),
                          constraints: BoxConstraints(
                            minWidth: 16.w,
                            minHeight: 16.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.redStart,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.surface,
                              width: 1.5,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              badgeCount > 99 ? '99+' : badgeCount.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w700,
                                height: 1,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 4.h),
                Text(
                  label,
                  style: TextStyle(
                    color: itemColor,
                    fontSize: 10.5.sp,
                    fontWeight: isSelected ? FontWeight.w800 : FontWeight.w500,
                  ),
                  maxLines: 1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}