import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_colors.dart';
import '../constants/icon_path.dart';

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
                icon: Icons.home_rounded,
              ),
              _buildNavItem(
                index: 1,
                label: 'Schedule',
                iconPath: IconPath.scheduleIcon,
                fallbackIcon: Icons.calendar_today_rounded,
              ),
              _buildNavItem(
                index: 2,
                label: 'Jobs',
                iconPath: IconPath.jobsIcon,
                fallbackIcon: Icons.assignment_rounded,
                badgeCount: jobsBadgeCount,
              ),
              _buildNavItem(
                index: 3,
                label: 'Customers',
                icon: Icons.people_alt_rounded,
              ),
              _buildNavItem(
                index: 4,
                label: 'Messages',
                icon: Icons.chat_bubble_rounded,
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
    IconData? icon,
    String? iconPath,
    IconData? fallbackIcon,
    int badgeCount = 0,
  }) {
    final bool isSelected = currentIndex == index;
    final Color itemColor =
        isSelected ? AppColors.orangeStart : AppColors.textSecondary;

    return Expanded(
      child: InkWell(
        onTap: () => onTap(index),
        splashColor: AppColors.orangeLight,
        highlightColor: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                if (iconPath != null)
                  Image.asset(
                    iconPath,
                    width: 22.w,
                    height: 22.h,
                    color: itemColor,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(
                        fallbackIcon ?? Icons.circle_outlined,
                        size: 22.sp,
                        color: itemColor,
                      );
                    },
                  )
                else
                  Icon(
                    icon ?? Icons.circle_outlined,
                    size: 22.sp,
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
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}