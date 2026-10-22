import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../../models/sync_item_model.dart';

class PendingChangeTile extends StatelessWidget {
  final SyncQueueItemModel item;

  const PendingChangeTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    Color iconBgColor;
    Color iconColor;

    switch (item.status) {
      case SyncItemStatus.completed:
        iconBgColor = const Color(0xFF14532D).withOpacity(0.5);
        iconColor = const Color(0xFF22C55E);
        break;
      case SyncItemStatus.failed:
        iconBgColor = const Color(0xFF7C2D12).withOpacity(0.5);
        iconColor = const Color(0xFFF97316);
        break;
      case SyncItemStatus.pending:
        iconBgColor = const Color(0xFF27272A);
        iconColor = const Color(0xFFA1A1AA);
        break;
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 32.w,
            height: 32.h,
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(item.icon, color: iconColor, size: 18.sp),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 3.h),
                Text(
                  item.subtitle,
                  style: TextStyle(
                    color: item.status == SyncItemStatus.failed
                        ? const Color(0xFFF97316)
                        : AppColors.textSecondary,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}