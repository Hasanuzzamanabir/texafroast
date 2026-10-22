import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:texafrost/features/schedule/models/schedule_slot_model.dart';
import 'schedule_job_card_widget.dart';

class ScheduleTimelineWidget extends StatelessWidget {
  const ScheduleTimelineWidget({
    super.key,
    required this.slots,
    this.onJobTap,
  });

  final List<ScheduleSlotModel> slots;
  final ValueChanged<ScheduleSlotModel>? onJobTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF111216), // Outer container background
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: Colors.white.withOpacity(0.06),
          width: 1,
        ),
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
            color: Colors.white.withOpacity(0.05),
          ),
          itemBuilder: (context, index) {
            final slot = slots[index];

            return IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Left: Time Column (e.g. 7am, 8am)
                  Container(
                    width: 64.w,
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          color: Colors.white.withOpacity(0.05),
                          width: 1,
                        ),
                      ),
                    ),
                    child: Text(
                      slot.time,
                      style: TextStyle(
                        color: const Color(0xFF6B7280), // Slate grey time label[cite: 10]
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  // Right: Job Slot Area[cite: 10]
                  Expanded(
                    child: Container(
                      constraints: BoxConstraints(minHeight: 56.h),
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                      alignment: Alignment.centerLeft,
                      child: slot.hasJob
                          ? ScheduleJobCardWidget(
                              title: slot.title!,
                              subtitle: '${slot.serviceTag} · ${slot.duration}',
                              onTap: () => onJobTap?.call(slot),
                            )
                          : const SizedBox.shrink(),
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