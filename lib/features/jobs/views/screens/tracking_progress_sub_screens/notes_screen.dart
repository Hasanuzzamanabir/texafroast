import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:texafrost/core/constants/app_colors.dart';
import 'package:texafrost/core/widgets/custom_app_bar_back.dart';
import 'package:texafrost/core/widgets/custom_button.dart';
import 'package:texafrost/features/jobs/view_models/job_tracking_view_model.dart';
import 'package:texafrost/features/jobs/views/widgets/custom_stepper_widget.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final TextEditingController _technicianNoteController =
      TextEditingController();
  final TextEditingController _customerNoteController = TextEditingController();
  final TextEditingController _followUpNoteController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _technicianNoteController.dispose();
    _customerNoteController.dispose();
    _followUpNoteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarBack(title: 'Notes'),
      body: SingleChildScrollView(
        child: Padding(
          padding: .symmetric(horizontal: 17.w),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              CustomStepper(currentStep: 3),
              SizedBox(height: 16.h),
              TabBar(
                indicatorColor: Colors.transparent,
                dividerHeight: 0,
                controller: _tabController,
                onTap: (index) {
                  setState(() {});
                },
                tabs: [
                  Container(
                    width: .maxFinite,
                    padding: .all(6.r),
                    decoration: BoxDecoration(
                      color: _tabController.index == 0
                          ? AppColors.orangeStart.withValues(alpha: .1)
                          : AppColors.surfaceLight,
                      borderRadius: .circular(10.r),
                      border: .all(
                        color: _tabController.index == 0
                            ? AppColors.orangeStart
                            : AppColors.inputBackground,
                        width: 1.w,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Text',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: .w700,
                          color: _tabController.index == 0
                              ? AppColors.orangeStart
                              : AppColors.labelText,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: .maxFinite,
                    padding: .all(6.r),
                    decoration: BoxDecoration(
                      color: _tabController.index == 1
                          ? AppColors.orangeStart.withValues(alpha: .1)
                          : AppColors.surfaceLight,
                      borderRadius: .circular(10.r),
                      border: .all(
                        color: _tabController.index == 1
                            ? AppColors.orangeStart
                            : AppColors.inputBackground,
                        width: 1.w,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Voice',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: .w700,
                          color: _tabController.index == 1
                              ? AppColors.orangeStart
                              : AppColors.labelText,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32.h),
              Text(
                'TECHNICIAN NOTES',
                style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: .w700,
                  color: AppColors.labelText,
                ),
              ),
              SizedBox(height: 12.h),
              TextFormField(
                onChanged: (value) {
                  setState(() {});
                },
                style: TextStyle(fontSize: 14.sp, color: AppColors.textPrimary),
                controller: _technicianNoteController,
                maxLines: 6,
                cursorColor: AppColors.orangeStart,
                decoration: InputDecoration(
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: .circular(16.r),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.inputBackground),
                    borderRadius: .circular(16.r),
                  ),
                  fillColor: AppColors.inputBackground,
                ),
              ),
              SizedBox(height: 32.h),
              Text(
                'CUSTOMER-FACING NOTES',
                style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: .w700,
                  color: AppColors.labelText,
                ),
              ),
              SizedBox(height: 12.h),
              TextFormField(
                onChanged: (value) {
                  setState(() {});
                },
                style: TextStyle(fontSize: 14.sp, color: AppColors.textPrimary),
                controller: _customerNoteController,
                maxLines: 6,
                cursorColor: AppColors.orangeStart,
                decoration: InputDecoration(
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: .circular(16.r),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.inputBackground),
                    borderRadius: .circular(16.r),
                  ),
                  fillColor: AppColors.inputBackground,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'These notes will appear on the customer\'s copy of the report.',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: .w400,
                  color: AppColors.labelText,
                ),
              ),
              SizedBox(height: 32.h),
              Text(
                'FOLLOW-UP RECOMMENDATIONS',
                style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: .w700,
                  color: AppColors.labelText,
                ),
              ),
              SizedBox(height: 12.h),
              TextFormField(
                onChanged: (value) {
                  setState(() {});
                },
                controller: _followUpNoteController,
                style: TextStyle(fontSize: 14.sp, color: AppColors.textPrimary),
                maxLines: 6,
                cursorColor: AppColors.orangeStart,
                decoration: InputDecoration(
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: .circular(16.r),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.inputBackground),
                    borderRadius: .circular(16.r),
                  ),
                  fillColor: AppColors.inputBackground,
                ),
              ),
              SizedBox(height: 16.h),
              CustomButtonWidget(
                title: 'Save & Continue',
                onTap:
                    _customerNoteController.text.trim().isEmpty ||
                        _followUpNoteController.text.trim().isEmpty ||
                        _technicianNoteController.text.trim().isEmpty
                    ? null
                    : () {
                        context.read<JobTrackingViewModel>().changeStepStatus(
                          index: 2,
                          value: true,
                        );
                        Navigator.pop(context);
                      },
              ),
              SizedBox(height: 50.h),
            ],
          ),
        ),
      ),
    );
  }
}
