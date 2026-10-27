import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../constants/app_colors.dart';
import '../../features/dashboard/models/dashboard_summary_model.dart';

class SyncStatusBar extends StatelessWidget {
  const SyncStatusBar({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DashboardProvider>();

    final bool isSyncing = provider.isSyncing;
    final int pendingCount = provider.pendingSyncCount;
    final bool hasPending = pendingCount > 0;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: hasPending ? AppColors.orangeLight : AppColors.surface,
        border: Border(
          bottom: BorderSide(
            color: hasPending ? AppColors.orangeBorder : AppColors.lightGrayBorder,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 8.r,
            height: 8.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSyncing
                  ? AppColors.blueStart
                  : (hasPending ? AppColors.orangeStart : AppColors.greenStart),
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              isSyncing
                  ? 'Syncing offline changes...'
                  : (hasPending
                      ? '$pendingCount pending items to upload'
                      : 'Sync Status: Up to date (${provider.lastSyncedTime})'),
              style: TextStyle(
                color: hasPending ? AppColors.orangeEnd : AppColors.textSecondary,
                fontSize: 11.5.sp,
                fontWeight: FontWeight.w600,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (isSyncing)
            SizedBox(
              width: 14.w,
              height: 14.h,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: AppColors.orangeStart,
              ),
            )
          else
            GestureDetector(
              onTap: () => provider.retrySync(),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: hasPending ? AppColors.orangeStart : AppColors.surfaceLight,
                  borderRadius: BorderRadius.circular(6.r),
                  border: Border.all(
                    color: hasPending ? AppColors.orangeStart : AppColors.lightGrayBorder,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.sync_rounded,
                      size: 13.sp,
                      color: hasPending ? Colors.white : AppColors.textPrimary,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      hasPending ? 'Retry' : 'Sync Now',
                      style: TextStyle(
                        color: hasPending ? Colors.white : AppColors.textPrimary,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
