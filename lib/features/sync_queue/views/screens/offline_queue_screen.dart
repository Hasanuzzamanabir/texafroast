import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../routes/app_routes.dart';
import '../../view_models/sync_queue_view_model.dart';

class OfflineQueueContentView extends StatelessWidget {
  const OfflineQueueContentView({super.key});

  @override
  Widget build(BuildContext context) {
    final syncViewModel = context.watch<SyncQueueViewModel>();

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),
            // Header
            Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 36.w,
                    height: 36.h,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E2129),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: AppColors.textPrimary,
                      size: 16.sp,
                    ),
                  ),
                ),
                SizedBox(width: 14.w),
                Text(
                  'Offline Queue',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),

            // Center Card: Dish Antenna & Offline Mode Active
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 36.h, horizontal: 20.w),
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
                  Text(
                    '📡',
                    style: TextStyle(fontSize: 48.sp),
                  ),
                  SizedBox(height: 18.h),
                  Text(
                    'Offline Mode Active',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'All changes are saved locally and will sync\nwhen connection is restored.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      height: 1.4,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    '${syncViewModel.pendingSyncCount}',
                    style: TextStyle(
                      color: AppColors.orangeStart,
                      fontSize: 36.sp,
                      fontWeight: FontWeight.w800,
                      height: 1,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    'CHANGES PENDING SYNC',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.8,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),

            // Force Sync Button
            CustomButtonWidget(
              title: syncViewModel.isSyncing ? 'Syncing...' : 'Force Sync Now',
              type: ButtonType.orange,
              onTap: () {
                // Navigate to SyncDetailsScreen or trigger sync
                Navigator.pushNamed(context, AppRoutes.syncDetails);
              }, 
            ),
          ],
        ),
      ),
    );
  }
}