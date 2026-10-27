import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../constants/app_colors.dart';
import '../../features/dashboard/view_models/dashboard_summary_view_model.dart';
import '../../features/profile/views/screens/profile_screen.dart';
import '../../routes/app_routes.dart';

class SecondaryMenuSheet extends StatelessWidget {
  const SecondaryMenuSheet({super.key});

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const SecondaryMenuSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final dashboardProvider = context.watch<DashboardProvider>();

    return Material(
      color: AppColors.surface,
      borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Center(
              child: Container(
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: AppColors.lightGrayBorder,
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
            ),
            SizedBox(height: 18.h),

            // User Info header
            Row(
              children: [
                CircleAvatar(
                  radius: 26.r,
                  backgroundColor: AppColors.orangeStart,
                  child: Text(
                    'TH',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                SizedBox(width: 14.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tom Harrison',
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        'Senior HVAC Technician · Field Ops',
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: AppColors.orangeLight,
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: AppColors.orangeBorder),
                  ),
                  child: Text(
                    'Field Tech',
                    style: TextStyle(
                      color: AppColors.orangeEnd,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20.h),
            Divider(color: AppColors.lightGrayBorder, height: 1),
            SizedBox(height: 12.h),

            Text(
              'ACCOUNT & PROFILE',
              style: TextStyle(
                color: AppColors.textMuted,
                fontSize: 10.5.sp,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.8,
              ),
            ),
            SizedBox(height: 6.h),
            _buildMenuItem(
              icon: Icons.person_outline_rounded,
              title: 'My Profile & Credentials',
              subtitle: 'Certifications, contact details & vehicle info',
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ProfileScreen()),
                );
              },
            ),
            _buildMenuItem(
              icon: Icons.settings_outlined,
              title: 'App Settings & Preferences',
              subtitle: 'Notifications, offline storage & defaults',
              onTap: () {
                Navigator.pop(context);
              },
            ),

            SizedBox(height: 12.h),
            Text(
              'SECONDARY TOOLS',
              style: TextStyle(
                color: AppColors.textMuted,
                fontSize: 10.5.sp,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.8,
              ),
            ),
            SizedBox(height: 6.h),
            _buildMenuItem(
              icon: Icons.cloud_sync_outlined,
              title: 'Offline Sync Queue',
              subtitle: dashboardProvider.pendingSyncCount > 0
                  ? '${dashboardProvider.pendingSyncCount} items queued'
                  : 'All data synced',
              trailing: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                decoration: BoxDecoration(
                  color: dashboardProvider.pendingSyncCount > 0
                      ? AppColors.orangeLight
                      : AppColors.greenLight,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  dashboardProvider.pendingSyncCount > 0 ? 'Pending' : 'Synced',
                  style: TextStyle(
                    color: dashboardProvider.pendingSyncCount > 0
                        ? AppColors.orangeEnd
                        : AppColors.greenStart,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, AppRoutes.syncDetails);
              },
            ),
            _buildMenuItem(
              icon: Icons.help_outline_rounded,
              title: 'Help & Field Support',
              subtitle: 'Documentation, standard operating procedures',
              onTap: () {
                Navigator.pop(context);
              },
            ),
            _buildMenuItem(
              icon: Icons.logout_rounded,
              title: 'Sign Out',
              titleColor: AppColors.redStart,
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.login,
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    ),
  );
}

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    String? subtitle,
    Widget? trailing,
    Color? titleColor,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        width: 38.w,
        height: 38.h,
        decoration: BoxDecoration(
          color: AppColors.surfaceLight,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: AppColors.lightGrayBorder),
        ),
        child: Icon(
          icon,
          size: 20.sp,
          color: titleColor ?? AppColors.textPrimary,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: titleColor ?? AppColors.textPrimary,
          fontSize: 13.5.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle,
              style: TextStyle(color: AppColors.textSecondary, fontSize: 11.sp),
            )
          : null,
      trailing:
          trailing ??
          Icon(
            Icons.chevron_right_rounded,
            color: AppColors.textMuted,
            size: 20.sp,
          ),
      onTap: onTap,
    );
  }
}
