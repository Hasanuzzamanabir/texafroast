import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:texafrost/core/constants/app_colors.dart';
import 'package:texafrost/core/widgets/custom_app_bar_back.dart';
import 'package:texafrost/core/widgets/custom_button.dart';
import 'package:texafrost/routes/app_routes.dart';

class ViewJobScreen extends StatefulWidget {
  final String? jobID;
  const ViewJobScreen({super.key, this.jobID});

  @override
  State<ViewJobScreen> createState() => _ViewJobScreenState();
}

class _ViewJobScreenState extends State<ViewJobScreen> {
  bool _isEnRoute = false;
  DateTime? _travelStartTime;
  Timer? _travelTimer;
  int _travelElapsedSeconds = 0;

  @override
  void dispose() {
    _travelTimer?.cancel();
    super.dispose();
  }

  void _startTravel() {
    setState(() {
      _isEnRoute = true;
      _travelStartTime = DateTime.now();
      _travelElapsedSeconds = 0;
    });

    _travelTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          _travelElapsedSeconds++;
        });
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Travel started! Live travel duration is now being logged.'),
        backgroundColor: AppColors.blueStart,
        duration: Duration(seconds: 2),
      ),
    );
  }

  String _formatTravelTimer() {
    if (!_isEnRoute) return '--:--';
    final minutes = _travelElapsedSeconds ~/ 60;
    final seconds = _travelElapsedSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  String _getStartTimeString() {
    if (_travelStartTime == null) return '--';
    final hour = _travelStartTime!.hour > 12
        ? _travelStartTime!.hour - 12
        : (_travelStartTime!.hour == 0 ? 12 : _travelStartTime!.hour);
    final minute = _travelStartTime!.minute.toString().padLeft(2, '0');
    final period = _travelStartTime!.hour >= 12 ? 'PM' : 'AM';
    return '$hour:$minute $period';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomAppBarBack(title: 'Job Overview'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12.h),

              // 1. Top Job Info Header Card
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(14.r),
                  border: Border.all(color: AppColors.lightGrayBorder),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.02),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.jobID ?? 'JOB-20240901-047',
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.8,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                          decoration: BoxDecoration(
                            color: _isEnRoute ? AppColors.blueLight : AppColors.orangeLight,
                            borderRadius: BorderRadius.circular(6.r),
                            border: Border.all(
                              color: _isEnRoute
                                  ? AppColors.blueStart.withValues(alpha: 0.3)
                                  : AppColors.orangeBorder,
                            ),
                          ),
                          child: Text(
                            _isEnRoute ? 'ON MY WAY' : 'ASSIGNED',
                            style: TextStyle(
                              color: _isEnRoute ? AppColors.blueStart : AppColors.orangeEnd,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 0.8,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Riverside Office Complex',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w800,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                          decoration: BoxDecoration(
                            color: AppColors.redLight,
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          child: Text(
                            'HIGH PRIORITY',
                            style: TextStyle(
                              color: AppColors.redStart,
                              fontSize: 10.5.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                          decoration: BoxDecoration(
                            color: AppColors.surfaceLight,
                            borderRadius: BorderRadius.circular(6.r),
                            border: Border.all(color: AppColors.lightGrayBorder),
                          ),
                          child: Text(
                            'Preventive Maintenance',
                            style: TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 10.5.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.h),

              // 2. Field Service Workflow Stepper Banner
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(14.w),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(14.r),
                  border: Border.all(color: AppColors.lightGrayBorder),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.02),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'FIELD SERVICE WORKFLOW',
                          style: TextStyle(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w800,
                            color: AppColors.textSecondary,
                            letterSpacing: 0.6,
                          ),
                        ),
                        Text(
                          _isEnRoute ? 'Step 1 of 4: En Route' : 'Ready to Depart',
                          style: TextStyle(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w700,
                            color: _isEnRoute ? AppColors.blueStart : AppColors.orangeStart,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildWorkflowStep('1. Travel', isCurrent: _isEnRoute, isCompleted: false),
                        _buildWorkflowArrow(),
                        _buildWorkflowStep('2. Arrive', isCurrent: false, isCompleted: false),
                        _buildWorkflowArrow(),
                        _buildWorkflowStep('3. Work', isCurrent: false, isCompleted: false),
                        _buildWorkflowArrow(),
                        _buildWorkflowStep('4. Finish', isCurrent: false, isCompleted: false),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceLight,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            _isEnRoute ? Icons.navigation : Icons.info_outline,
                            size: 16.sp,
                            color: _isEnRoute ? AppColors.blueStart : AppColors.textSecondary,
                          ),
                          SizedBox(width: 8.w),
                          Expanded(
                            child: Text(
                              _isEnRoute
                                  ? 'Travel in progress. When parked on-site, tap "I\'ve Arrived" below.'
                                  : 'Tap "Start Travel (On My Way)" when heading to the client site.',
                              style: TextStyle(
                                fontSize: 11.5.sp,
                                color: AppColors.textSecondary,
                                height: 1.3,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.h),

              // 3. Item 2: Travel Time & Time Spent on the Job (Work Log Card)
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(14.r),
                  border: Border.all(color: AppColors.lightGrayBorder),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.02),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'TIME TRACKING & WORK LOG',
                          style: TextStyle(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w800,
                            color: AppColors.textSecondary,
                            letterSpacing: 0.6,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.h),
                          decoration: BoxDecoration(
                            color: _isEnRoute ? AppColors.blueLight : AppColors.surfaceLight,
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 6.w,
                                height: 6.h,
                                decoration: BoxDecoration(
                                  color: _isEnRoute ? AppColors.blueStart : AppColors.textMuted,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(width: 5.w),
                              Text(
                                _isEnRoute ? 'LOGGING LIVE' : 'STANDBY',
                                style: TextStyle(
                                  fontSize: 9.5.sp,
                                  fontWeight: FontWeight.w800,
                                  color: _isEnRoute ? AppColors.blueStart : AppColors.textMuted,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 14.h),

                    // Travel Time & Time on Job Side-by-Side Cards
                    Row(
                      children: [
                        // Travel Time Card
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(12.w),
                            decoration: BoxDecoration(
                              color: _isEnRoute
                                  ? AppColors.blueLight
                                  : AppColors.surfaceLight,
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(
                                color: _isEnRoute
                                    ? AppColors.blueStart.withValues(alpha: 0.3)
                                    : AppColors.lightGrayBorder,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.directions_car,
                                      size: 16.sp,
                                      color: _isEnRoute ? AppColors.blueStart : AppColors.textSecondary,
                                    ),
                                    SizedBox(width: 5.w),
                                    Text(
                                      'TRAVEL TIME',
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w700,
                                        color: _isEnRoute ? AppColors.blueStart : AppColors.textSecondary,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 6.h),
                                Text(
                                  _formatTravelTimer(),
                                  style: TextStyle(
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.w900,
                                    color: _isEnRoute ? AppColors.blueEnd : AppColors.textSecondary,
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  _isEnRoute
                                      ? 'Started: ${_getStartTimeString()}\nETA: 13 min remaining'
                                      : 'Tap "Start Travel"\nwhen departing',
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    color: AppColors.textSecondary,
                                    height: 1.3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),

                        // Time Spent on the Job Card
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(12.w),
                            decoration: BoxDecoration(
                              color: AppColors.orangeLight,
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(color: AppColors.orangeBorder),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.timer_outlined, size: 16.sp, color: AppColors.orangeStart),
                                    SizedBox(width: 5.w),
                                    Text(
                                      'TIME ON JOB',
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.orangeEnd,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 6.h),
                                Text(
                                  '00:00:00',
                                  style: TextStyle(
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.w900,
                                    color: AppColors.orangeEnd,
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  'Status: Pending arrival\nEst. Labor: ~2.5 hrs',
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    color: AppColors.textSecondary,
                                    height: 1.3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),

                    // Appointment Schedule Window Row
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceLight,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.calendar_today_outlined, size: 14.sp, color: AppColors.textSecondary),
                          SizedBox(width: 8.w),
                          Expanded(
                            child: Text(
                              'Appointment Window: Today 8:00 AM – 10:00 AM',
                              style: TextStyle(
                                fontSize: 11.5.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.h),

              // 4. Item 3: Assigned Technicians & Quick Contact (Call / Message)
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(14.r),
                  border: Border.all(color: AppColors.lightGrayBorder),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.02),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'ASSIGNED TECHNICIANS (2)',
                          style: TextStyle(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w800,
                            color: AppColors.textSecondary,
                            letterSpacing: 0.6,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.h),
                          decoration: BoxDecoration(
                            color: AppColors.orangeLight,
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          child: Text(
                            'CREW ON JOB',
                            style: TextStyle(
                              fontSize: 9.5.sp,
                              fontWeight: FontWeight.w800,
                              color: AppColors.orangeEnd,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 14.h),

                    // Lead Tech: Tom Harrison
                    _buildTechnicianRow(
                      name: 'Tom Harrison',
                      role: 'Lead HVAC Specialist',
                      phone: '(713) 555-0143',
                      avatarInitials: 'TH',
                      isLead: true,
                    ),

                    Divider(height: 22.h, color: AppColors.lightGrayBorder),

                    // Associate Tech: Alex Rivera
                    _buildTechnicianRow(
                      name: 'Alex Rivera',
                      role: 'Associate Field Tech',
                      phone: '(713) 555-0188',
                      avatarInitials: 'AR',
                      isLead: false,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.h),

              // 5. Navigation & Map Preview
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(14.r),
                  border: Border.all(color: AppColors.lightGrayBorder),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.02),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 170.h,
                      decoration: BoxDecoration(
                        color: AppColors.surfaceLight,
                        borderRadius: BorderRadius.vertical(top: Radius.circular(14.r)),
                      ),
                      child: Icon(
                        Icons.map_outlined,
                        color: AppColors.orangeStart,
                        size: 44.sp,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(14.0.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.near_me_outlined, color: AppColors.orangeStart, size: 18.sp),
                              SizedBox(width: 6.w),
                              Text(
                                'Tap to open full GPS navigation',
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.orangeStart,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '13 min',
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w900,
                              color: AppColors.orangeEnd,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.h),

              // 5. Destination & Quick Contact
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(14.w),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(14.r),
                  border: Border.all(color: AppColors.lightGrayBorder),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.02),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'SERVICE ADDRESS & DESTINATION',
                      style: TextStyle(
                        fontSize: 10.5.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textSecondary,
                        letterSpacing: 0.6,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Riverside Office Complex',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w800,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      '2847 Commerce Blvd, Suite 400, Houston, TX 77002',
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    SizedBox(height: 14.h),
                    Row(
                      children: [
                        Expanded(
                          child: FilledButton.icon(
                            style: FilledButton.styleFrom(
                              backgroundColor: const Color(0xff3B82F6).withValues(alpha: 0.15),
                              foregroundColor: const Color(0xff3B82F6),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                side: const BorderSide(color: AppColors.blueStart),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                            ),
                            onPressed: () {},
                            icon: const Icon(Icons.navigation_outlined, size: 18),
                            label: const Text(
                              'Directions',
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                              foregroundColor: AppColors.orangeStart,
                              side: const BorderSide(color: AppColors.orangeStart),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                            ),
                            onPressed: () {},
                            icon: const Icon(Icons.call_outlined, size: 18),
                            label: const Text(
                              'Call Customer',
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.h),

              // 6. Travel & Distance Stats
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(14.w),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(14.r),
                  border: Border.all(color: AppColors.lightGrayBorder),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildStatCard(title: 'DISTANCE', value: '3.2 mi'),
                    _buildStatCard(title: 'EST. TRAVEL', value: '13 min'),
                    _buildStatCard(title: 'ARRIVAL ETA', value: '10:29 AM'),
                  ],
                ),
              ),
              SizedBox(height: 16.h),

              // 7. Dynamic 2-State Primary Action Button
              CustomButtonWidget(
                title: _isEnRoute
                    ? 'I\'ve Arrived at Location ✓'
                    : 'Start Travel (On My Way) ➔',
                type: _isEnRoute ? ButtonType.green : ButtonType.orange,
                onTap: () {
                  if (!_isEnRoute) {
                    _startTravel();
                  } else {
                    _travelTimer?.cancel();
                    Navigator.pushNamed(context, AppRoutes.arrivedJob);
                  }
                },
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWorkflowStep(String label, {required bool isCurrent, required bool isCompleted}) {
    return Column(
      children: [
        CircleAvatar(
          radius: 12.r,
          backgroundColor: isCurrent
              ? AppColors.blueStart
              : (isCompleted ? AppColors.greenStart : AppColors.surfaceLight),
          child: Icon(
            isCompleted ? Icons.check : (isCurrent ? Icons.directions_car : Icons.circle),
            size: 11.sp,
            color: isCurrent || isCompleted
                ? Colors.white
                : AppColors.textMuted,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          style: TextStyle(
            color: isCurrent
                ? AppColors.blueStart
                : (isCompleted ? AppColors.greenEnd : AppColors.textSecondary),
            fontSize: 10.5.sp,
            fontWeight: isCurrent ? FontWeight.w800 : FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildWorkflowArrow() {
    return Icon(
      Icons.chevron_right_rounded,
      color: AppColors.orangeBorder,
      size: 16.sp,
    );
  }

  Widget _buildStatCard({required String title, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w800,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 3.h),
        Text(
          title,
          style: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textSecondary,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }

  Widget _buildTechnicianRow({
    required String name,
    required String role,
    required String phone,
    required String avatarInitials,
    required bool isLead,
  }) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20.r,
          backgroundColor: isLead ? AppColors.orangeStart : AppColors.blueStart,
          child: Text(
            avatarInitials,
            style: TextStyle(
              color: Colors.white,
              fontSize: 13.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  if (isLead) ...[
                    SizedBox(width: 6.w),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.5.h),
                      decoration: BoxDecoration(
                        color: AppColors.orangeLight,
                        borderRadius: BorderRadius.circular(4.r),
                        border: Border.all(color: AppColors.orangeBorder),
                      ),
                      child: Text(
                        'LEAD',
                        style: TextStyle(
                          fontSize: 8.5.sp,
                          fontWeight: FontWeight.w800,
                          color: AppColors.orangeEnd,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
              SizedBox(height: 2.h),
              Text(
                '$role · $phone',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 11.5.sp,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 6.w),
        // Call button
        InkWell(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Calling $name ($phone)...'),
                backgroundColor: AppColors.orangeStart,
                duration: const Duration(seconds: 2),
              ),
            );
          },
          borderRadius: BorderRadius.circular(8.r),
          child: Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: AppColors.orangeLight,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: AppColors.orangeBorder),
            ),
            child: Icon(
              Icons.phone_outlined,
              size: 17.sp,
              color: AppColors.orangeStart,
            ),
          ),
        ),
        SizedBox(width: 6.w),
        // Message button
        InkWell(
          onTap: () => _showChatDetail(
            context,
            name,
            'Hey $name, are you heading to Riverside Office Complex?',
          ),
          borderRadius: BorderRadius.circular(8.r),
          child: Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: AppColors.blueLight,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: AppColors.blueStart.withValues(alpha: 0.3)),
            ),
            child: Icon(
              Icons.chat_bubble_outline_rounded,
              size: 17.sp,
              color: AppColors.blueStart,
            ),
          ),
        ),
      ],
    );
  }

  void _showChatDetail(BuildContext context, String sender, String lastMessage) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => Container(
        height: 0.75.sh,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        ),
        child: Column(
          children: [
            Container(
              width: 36.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: AppColors.lightGrayBorder,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                CircleAvatar(
                  radius: 18.r,
                  backgroundColor: AppColors.orangeStart,
                  child: Text(
                    sender.substring(0, 1),
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        sender,
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        'Assigned Field Technician',
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 11.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close_rounded),
                ),
              ],
            ),
            const Divider(),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.all(12.w),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceLight,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Text(
                        lastMessage,
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 13.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              decoration: BoxDecoration(
                color: AppColors.surfaceLight,
                borderRadius: BorderRadius.circular(24.r),
                border: Border.all(color: AppColors.lightGrayBorder),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Type message to $sender...',
                        hintStyle: TextStyle(
                          color: AppColors.inputHint,
                          fontSize: 13.sp,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.send_rounded),
                    color: AppColors.orangeStart,
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.h),
          ],
        ),
      ),
    );
  }
}
