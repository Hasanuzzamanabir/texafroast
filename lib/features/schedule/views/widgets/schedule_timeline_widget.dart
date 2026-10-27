import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../../models/schedule_slot_model.dart';
import 'schedule_job_card_widget.dart';

class ScheduleTimelineWidget extends StatelessWidget {
  const ScheduleTimelineWidget({super.key, required this.slots, this.onJobTap});

  final List<ScheduleSlotModel> slots;
  final ValueChanged<ScheduleSlotModel>? onJobTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.lightGrayBorder, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: slots.length,
          separatorBuilder: (context, index) => Divider(
            height: 1,
            thickness: 1,
            color: AppColors.lightGrayBorder,
          ),
          itemBuilder: (context, index) {
            final slot = slots[index];

            return IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Left: Time Column (e.g. 8:00 AM)
                  Container(
                    width: 72.w,
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 14.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceLight.withOpacity(0.5),
                      border: Border(
                        right: BorderSide(
                          color: AppColors.lightGrayBorder,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Text(
                      slot.time,
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 11.5.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  // Right: Job Slot Area
                  Expanded(
                    child: Container(
                      constraints: BoxConstraints(minHeight: 52.h),
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 4.h,
                      ),
                      alignment: Alignment.centerLeft,
                      child: slot.hasJob
                          ? ScheduleJobCardWidget(
                              slot: slot,
                              onTap: () => onJobTap?.call(slot),
                            )
                          : Center(
                              child: Text(
                                'Available Slot',
                                style: TextStyle(
                                  color: AppColors.textMuted.withOpacity(0.5),
                                  fontSize: 11.sp,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
