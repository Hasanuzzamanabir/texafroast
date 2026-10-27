import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:texafrost/core/constants/app_colors.dart';
import 'package:texafrost/core/theme/app_decoration.dart';
import 'package:texafrost/core/widgets/custom_app_bar_back.dart';
import 'package:texafrost/core/widgets/custom_button.dart';
import 'package:texafrost/features/jobs/view_models/job_tracking_view_model.dart';
import 'package:texafrost/features/jobs/views/widgets/checkbox_widget.dart';
import 'package:texafrost/features/jobs/views/widgets/custom_stepper_widget.dart';

class ChecklistScreen extends StatefulWidget {
  const ChecklistScreen({super.key});

  @override
  State<ChecklistScreen> createState() => _ChecklistScreenState();
}

class _ChecklistScreenState extends State<ChecklistScreen> {
  bool? _chk1 = false;
  bool? _chk2 = false;
  bool? _chk3 = false;
  bool? _chk4 = false;
  bool? _chk5 = false;
  bool? _chk6 = false;
  bool? _chk7 = false;
  bool? _chk8 = false;
  bool? _chk9 = false;
  bool? _chk10 = false;
  bool? _chk11 = false;
  bool? _chk12 = false;
  bool? _chk13 = false;
  bool? _chk14 = false;
  bool? _chk15 = false;
  bool? _chk16 = false;

  @override
  Widget build(BuildContext context) {
    int totalChecked = [
      _chk1,
      _chk2,
      _chk3,
      _chk4,
      _chk5,
      _chk6,
      _chk7,
      _chk8,
      _chk9,
      _chk10,
      _chk11,
      _chk12,
      _chk13,
      _chk14,
      _chk15,
      _chk16,
    ].where((e) => e == true).length;
    return Scaffold(
      appBar: CustomAppBarBack(title: 'Checklist'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 17.w),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              CustomStepper(
                currentStep: 1, // Diag selected
              ),
              SizedBox(height: 16.h),
              Container(
                width: .maxFinite,
                padding: .all(20.r),
                decoration: BoxDecoration(
                  color: AppColors.inputBackground,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Text(
                          'Completion',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        Text(
                          '${totalChecked}/16',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: .w700,
                            color: AppColors.orangeStart,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    LinearProgressIndicator(
                      value: totalChecked / 16,
                      minHeight: 8.h,
                      borderRadius: BorderRadius.circular(8.r),
                      backgroundColor: AppColors.cardBorder,
                      valueColor: AlwaysStoppedAnimation(AppColors.orangeStart),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32.h),
              getHeader(title: 'SAFETY'),
              Container(
                width: .maxFinite,
                decoration: BoxDecoration(
                  color: AppColors.inputBackground,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(4.r),
                      child: getCheckBox(
                        val: _chk1 ?? false,
                        title: 'Lock out / tag out procedures verified',
                        onChanged: (value) {
                          setState(() {
                            _chk1 = value;
                          });
                        },
                      ),
                    ),
                    Divider(),
                    getCheckBox(
                      val: _chk2 ?? false,
                      title: 'Personal protective equipment in use',
                      onChanged: (value) {
                        setState(() {
                          _chk2 = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 26.h),
              getHeader(title: 'ELECTRICAL'),
              Container(
                width: .maxFinite,
                decoration: AppDecorations.container,
                child: Column(
                  children: [
                    getCheckBox(
                      val: _chk3 ?? false,
                      title: 'Voltage and amperage within specs',
                      onChanged: (value) {
                        setState(() {
                          _chk3 = value;
                        });
                      },
                    ),
                    Divider(),
                    getCheckBox(
                      val: _chk4 ?? false,
                      title: 'All electrical connections tight and secure',
                      onChanged: (value) {
                        setState(() {
                          _chk4 = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 26.h),
              getHeader(title: 'REFRIGERANT'),
              Container(
                width: .maxFinite,
                decoration: AppDecorations.container,
                child: Column(
                  children: [
                    getCheckBox(
                      val: _chk5 ?? false,
                      title: 'Refrigerant levels checked (no leak detected)',
                      onChanged: (value) {
                        setState(() {
                          _chk5 = value;
                        });
                      },
                    ),
                    Divider(),
                    getCheckBox(
                      val: _chk6 ?? false,
                      title: 'Suction and discharge pressures recorded',
                      onChanged: (value) {
                        setState(() {
                          _chk6 = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 26.h),
              getHeader(title: 'AIRFLOW'),
              Container(
                width: .maxFinite,
                decoration: AppDecorations.container,
                child: Column(
                  children: [
                    getCheckBox(
                      val: _chk7 ?? false,
                      title: 'Filter inspected / replaced',
                      onChanged: (value) {
                        setState(() {
                          _chk7 = value;
                        });
                      },
                    ),
                    Divider(),
                    getCheckBox(
                      val: _chk8 ?? false,
                      title: 'Evaporator and condenser coils cleaned',
                      onChanged: (value) {
                        setState(() {
                          _chk8 = value;
                        });
                      },
                    ),
                    Divider(),
                    getCheckBox(
                      val: _chk9 ?? false,
                      title: 'Blower wheel and belt inspected',
                      onChanged: (value) {
                        setState(() {
                          _chk9 = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 26.h),
              getHeader(title: 'CONTROLS'),
              Container(
                width: .maxFinite,
                decoration: AppDecorations.container,
                child: Column(
                  children: [
                    getCheckBox(
                      val: _chk10 ?? false,
                      title: 'Thermostat calibrated and tested',
                      onChanged: (value) {
                        setState(() {
                          _chk10 = value;
                        });
                      },
                    ),
                    Divider(),
                    getCheckBox(
                      val: _chk11 ?? false,
                      title: 'Safety controls and limits verified',
                      onChanged: (value) {
                        setState(() {
                          _chk11 = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 26.h),
              getHeader(title: 'DRAINAGE'),
              Container(
                width: .maxFinite,
                decoration: AppDecorations.container,
                child: Column(
                  children: [
                    getCheckBox(
                      val: _chk12 ?? false,
                      title: 'Condensate drain cleared and flushed',
                      onChanged: (value) {
                        setState(() {
                          _chk12 = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 26.h),
              getHeader(title: 'MECHANICAL'),
              Container(
                width: .maxFinite,
                decoration: AppDecorations.container,
                child: Column(
                  children: [
                    getCheckBox(
                      val: _chk13 ?? false,
                      title: 'Bearings lubricated',
                      onChanged: (value) {
                        setState(() {
                          _chk13 = value;
                        });
                      },
                    ),
                    Divider(),
                    getCheckBox(
                      val: _chk14 ?? false,
                      title: 'Fan blades and motor inspected',
                      onChanged: (value) {
                        setState(() {
                          _chk14 = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 26.h),
              getHeader(title: 'FINAL'),
              Container(
                width: .maxFinite,
                decoration: AppDecorations.container,
                child: Column(
                  children: [
                    getCheckBox(
                      val: _chk15 ?? false,
                      title: 'System tested under full load operation',
                      onChanged: (value) {
                        setState(() {
                          _chk15 = value;
                        });
                      },
                    ),
                    Divider(),
                    getCheckBox(
                      val: _chk16 ?? false,
                      title: 'Customer walk-through completed',
                      onChanged: (value) {
                        setState(() {
                          _chk16 = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              CustomButtonWidget(
                title: 'Save & Continue',
                onTap: totalChecked != 16
                    ? null
                    : () {
                        context.read<JobTrackingViewModel>().changeStepStatus(
                          index: 0,
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

  Widget getHeader({required String title}) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppColors.labelText,
            fontSize: 11.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 8.h),
      ],
    );
  }
}
