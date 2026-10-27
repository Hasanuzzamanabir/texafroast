import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:texafrost/features/schedule/view_models/schedule_view_model.dart';
import 'package:texafrost/routes/app_routes.dart';
import '../../../../core/constants/app_colors.dart';
import '../widgets/schedule_timeline_widget.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  final List<String> _dartWeekdays = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  final List<String> _dartMonths = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  final List<Map<String, dynamic>> _calendarDays = [
    {
      'day': '${DateTime.now().add(const Duration(days: -2)).weekday}',
      'date': '${DateTime.now().day - 2}',
      'month': 'Sep',
    },
    {
      'day': '${DateTime.now().add(const Duration(days: -1)).weekday}',
      'date': '${DateTime.now().day - 1}',
      'month': 'Sep',
    },
    {
      'day': '${DateTime.now().add(const Duration(days: 0)).weekday}',
      'date': '${DateTime.now().day}',
      'month': 'Sep',
    },
    {
      'day': '${DateTime.now().add(const Duration(days: 1)).weekday}',
      'date': '${DateTime.now().day + 1}',
      'month': 'Sep',
    },
    {
      'day': '${DateTime.now().add(const Duration(days: 2)).weekday}',
      'date': '${DateTime.now().day + 2}',
      'month': 'Sep',
    },
    {
      'day': '${DateTime.now().add(const Duration(days: 3)).weekday}',
      'date': '${DateTime.now().day + 3}',
      'month': 'Sep',
    },
    {
      'day': '${DateTime.now().add(const Duration(days: 4)).weekday}',
      'date': '${DateTime.now().day + 4}',
      'month': 'Sep',
    },
  ];
  DateTime? _selectedDate;
  @override
  Widget build(BuildContext context) {
    final scheduleProvider = context.watch<ScheduleProvider>();
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Top Header with Date Title & Calendar action
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Schedule',
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          '${_dartWeekdays[DateTime.now().weekday - 1]}, ${_dartMonths[DateTime.now().month - 1]} ${DateTime.now().day}, ${DateTime.now().year}',
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8.w),
                  GestureDetector(
                    onTap: () async {
                      _selectedDate = await showDatePicker(
                        barrierColor: AppColors.orangeStart.withValues(
                          alpha: 0.05,
                        ),
                        context: context,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2100),
                        initialDate: DateTime.now(),
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: ColorScheme.light(
                                primary: AppColors
                                    .orangeStart, // Header & selected date
                                onPrimary:
                                    AppColors.orangeEnd, // Text on header
                                onSurface:
                                    AppColors.textPrimary, // Default text color
                              ),
                              datePickerTheme: DatePickerThemeData(
                                headerBackgroundColor: AppColors.orangeStart,
                                headerForegroundColor: Colors.white,

                                todayBackgroundColor: WidgetStateProperty.all(
                                  AppColors.orangeStart.withValues(alpha: 0.1),
                                ),

                                dayBackgroundColor:
                                    WidgetStateProperty.resolveWith((states) {
                                      if (states.contains(
                                        WidgetState.selected,
                                      )) {
                                        return AppColors.orangeStart;
                                      }
                                      return null;
                                    }),

                                dayForegroundColor:
                                    WidgetStateProperty.resolveWith((states) {
                                      if (states.contains(
                                        WidgetState.disabled,
                                      )) {
                                        return Colors
                                            .grey; // Disabled date text color
                                      }

                                      if (states.contains(
                                        WidgetState.selected,
                                      )) {
                                        return Colors.white;
                                      }

                                      return Colors.black;
                                    }),
                              ),
                            ),
                            child: child!,
                          );
                        },
                      );
                      setState(() {});
                    },
                    child: Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(color: AppColors.lightGrayBorder),
                      ),
                      child: Icon(
                        Icons.calendar_month_outlined,
                        color: AppColors.orangeStart,
                        size: 20.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // 2. Date Selection Strip (Horizontal Calendar Ribbon)
            if (_selectedDate == null)
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  children: List.generate(_calendarDays.length, (index) {
                    final isSelected =
                        scheduleProvider.selectedDateIndex == index;
                    final item = _calendarDays[index];

                    return GestureDetector(
                      onTap: () => scheduleProvider.selectDate(index),
                      child: Container(
                        margin: EdgeInsets.only(right: 8.w),
                        padding: EdgeInsets.symmetric(
                          horizontal: 14.w,
                          vertical: 10.h,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.orangeStart
                              : AppColors.surface,
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(
                            color: isSelected
                                ? AppColors.orangeStart
                                : AppColors.lightGrayBorder,
                          ),
                          boxShadow: isSelected
                              ? [
                                  BoxShadow(
                                    color: AppColors.orangeStart.withOpacity(
                                      0.25,
                                    ),
                                    blurRadius: 8,
                                    offset: const Offset(0, 3),
                                  ),
                                ]
                              : null,
                        ),
                        child: Column(
                          children: [
                            Text(
                              _dartWeekdays[int.parse(item['day']) - 1],
                              style: TextStyle(
                                color: isSelected
                                    ? Colors.white70
                                    : AppColors.textSecondary,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              item['date']!,
                              style: TextStyle(
                                color: isSelected
                                    ? Colors.white
                                    : AppColors.textPrimary,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              )
            else
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
                child: InkWell(
                  onTap: () => setState(() {
                    _selectedDate = null;
                    scheduleProvider.selectDate(0);
                    scheduleProvider.selectFilter(0);
                  }),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.orangeLight,
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: AppColors.lightGrayBorder),
                    ),

                    width: double.infinity,
                    padding: .all(10.r),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.close, size: 20.sp, color: Colors.red),
                        SizedBox(width: 10.w),
                        Text(
                          'Clear date filter',
                          style: TextStyle(color: Colors.red, fontSize: 14.sp),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            SizedBox(height: 10.h),

            // 3. Relevant Filters Strip
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: List.generate(scheduleProvider.filters.length, (
                  index,
                ) {
                  final isSelected =
                      scheduleProvider.selectedFilterIndex == index;

                  return GestureDetector(
                    onTap: () => scheduleProvider.selectFilter(index),
                    child: Container(
                      margin: EdgeInsets.only(right: 8.w),
                      padding: EdgeInsets.symmetric(
                        horizontal: 14.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.orangeStart
                            : AppColors.surface,
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(
                          color: isSelected
                              ? AppColors.orangeStart
                              : AppColors.lightGrayBorder,
                        ),
                      ),
                      child: Text(
                        scheduleProvider.filters[index],
                        style: TextStyle(
                          color: isSelected
                              ? Colors.white
                              : AppColors.textSecondary,
                          fontSize: 11.5.sp,
                          fontWeight: isSelected
                              ? FontWeight.w700
                              : FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(height: 12.h),

            Divider(height: 1, color: AppColors.lightGrayBorder),

            // 4. Scrollable Timeline Section
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 4.w, bottom: 8.h),
                      child: Text(
                        "TIMELINE APPOINTMENTS · 4 SCHEDULED",
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.8,
                        ),
                      ),
                    ),

                    // Timeline Table Grid
                    ScheduleTimelineWidget(
                      slots: scheduleProvider.slots,
                      onJobTap: (slot) {
                        if (slot.hasJob) {
                          // Opening an appointment takes the user directly into that job
                          Navigator.pushNamed(
                            context,
                            AppRoutes.jobDetails,
                            arguments: slot.jobId,
                          );
                        }
                      },
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
