import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../../models/schedule_slot_model.dart';

class ScheduleJobCardWidget extends StatelessWidget {
  const ScheduleJobCardWidget({super.key, required this.slot, this.onTap});

  final ScheduleSlotModel slot;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final bool isInProgress = slot.status == 'IN PROGRESS';

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 6.h),
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isInProgress
                ? AppColors.orangeStart.withOpacity(0.5)
                : AppColors.lightGrayBorder,
            width: isInProgress ? 1.5 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Row: Status badge & Arrival Window
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (slot.status != null)
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 5.w,
                        vertical: 2.h,
                      ),
                      decoration: BoxDecoration(
                        color: isInProgress
                            ? AppColors.orangeStart
                            : AppColors.surfaceLight,
                        borderRadius: BorderRadius.circular(4.r),
                        border: Border.all(
                          color: isInProgress
                              ? AppColors.orangeStart
                              : AppColors.lightGrayBorder,
                        ),
                      ),
                      child: Text(
                        slot.status!,
                        style: TextStyle(
                          color: isInProgress
                              ? Colors.white
                              : AppColors.textSecondary,
                          fontSize: 9.sp,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.5,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                SizedBox(width: 4.w),
                if (slot.arrivalWindow != null)
                  Flexible(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.access_time_filled_rounded,
                          size: 11.sp,
                          color: AppColors.orangeEnd,
                        ),
                        SizedBox(width: 3.w),
                        Flexible(
                          child: Text(
                            slot.arrivalWindow!,
                            style: TextStyle(
                              color: AppColors.orangeEnd,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w700,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
            SizedBox(height: 6.h),

            // Customer / Property Name
            Text(
              slot.title ?? '',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 14.5.sp,
                fontWeight: FontWeight.w800,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),

            // Address
            if (slot.address != null) ...[
              SizedBox(height: 3.h),
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 13.sp,
                    color: AppColors.textSecondary,
                  ),
                  SizedBox(width: 4.w),
                  Expanded(
                    child: Text(
                      slot.address!,
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 11.5.sp,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],

            SizedBox(height: 6.h),
            Divider(color: AppColors.lightGrayBorder, height: 1),
            SizedBox(height: 6.h),

            // Bottom Row: Assigned Tech & Service Tag
            Wrap(
              spacing: 8.w,
              runSpacing: 4.h,
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                if (slot.assignedTechnician != null)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.person_outline_rounded,
                        size: 13.sp,
                        color: AppColors.textSecondary,
                      ),
                      SizedBox(width: 4.w),
                      ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 100.w),
                        child: Text(
                          slot.assignedTechnician!,
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 10.5.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                if (slot.serviceTag != null)
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 2.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.orangeLight,
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Text(
                      '${slot.serviceTag} · ${slot.duration}',
                      style: TextStyle(
                        color: AppColors.orangeEnd,
                        fontSize: 10.5.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
