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
  });

  final int currentIndex;
  final ValueChanged<int> onTap;
  final int jobsBadgeCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF0F1015), 
        border: Border(
          top: BorderSide(
            color: Colors.white.withOpacity(0.06),
            width: 1,
          ),
        ),
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
                label: 'Jobs',
                iconPath: IconPath.jobsIcon,
                badgeCount: jobsBadgeCount,
              ),
              _buildNavItem(
                index: 1,
                label: 'Schedule',
                iconPath: IconPath.scheduleIcon,
              ),
              _buildNavItem(
                index: 2,
                label: 'Sync',
                iconPath: IconPath.syncIcon,
              ),
              _buildNavItem(
                index: 3,
                label: 'Profile',
                iconPath: IconPath.profileIcon,
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
    required String iconPath,
    int badgeCount = 0,
  }) {
    final bool isSelected = currentIndex == index;
    final Color itemColor =
        isSelected ? AppColors.orangeStart : const Color(0xFF6B7280); 

    return Expanded(
      child: InkWell(
        onTap: () => onTap(index),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset(
                  iconPath,
                  width: 24.w,
                  height: 24.h,
                  color: itemColor,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      Icons.circle_outlined,
                      size: 22.sp,
                      color: itemColor,
                    );
                  },
                ),
                if (badgeCount > 0)
                  Positioned(
                    top: -5.h,
                    right: -7.w,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 4.w,
                        vertical: 1.h,
                      ),
                      constraints: BoxConstraints(
                        minWidth: 15.w,
                        minHeight: 15.h,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEF4444),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFF0F1015),
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
            SizedBox(height: 5.h),
            Text(
              label,
              style: TextStyle(
                color: itemColor,
                fontSize: 11.sp,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}