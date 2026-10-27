import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:texafrost/core/constants/app_colors.dart';
import 'package:texafrost/core/widgets/custom_app_bar_back.dart';
import 'package:texafrost/core/widgets/custom_button.dart';
import 'package:texafrost/features/jobs/views/widgets/checkbox_widget.dart';
import 'package:texafrost/routes/app_routes.dart';

class ArrivedJobScreen extends StatefulWidget {
  const ArrivedJobScreen({super.key});

  @override
  State<ArrivedJobScreen> createState() => _ArrivedJobScreenState();
}

class _ArrivedJobScreenState extends State<ArrivedJobScreen> {
  bool _chk1 = false;
  bool _chk2 = false;
  bool _chk3 = false;
  bool _chk4 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarBack(title: 'Arrived'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 17.w),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            SizedBox(height: 16.h),
            Container(
              padding: EdgeInsets.all(20.r),
              width: .maxFinite,
              decoration: BoxDecoration(
                color: AppColors.inputBackground,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: AppColors.orangeBorder, width: 1),
              ),
              child: Column(
                crossAxisAlignment: .center,
                children: [
                  Icon(
                    Icons.pin_drop_outlined,
                    size: 48.r,
                    color: AppColors.orangeStart,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'ARRIVED AT LOCATION',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: .w600,
                      color: AppColors.orangeStart,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'Riverside Office Complex',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: .w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    '8:00 AM',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: .w400,
                      color: const Color(0xffA9A9A9),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.h),
            Text(
              'Pre-Work Checklist',
              style: TextStyle(
                fontSize: 11.sp,
                fontWeight: .w700,
                color: AppColors.labelText,
              ),
            ),
            SizedBox(height: 8.h),
            Container(
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                color: AppColors.inputBackground,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Column(
                children: [
                  getCheckBox(
                    val: _chk1,
                    title: 'Identified correct service address',
                    onChanged: (value) {
                      setState(() {
                        _chk1 = value ?? false;
                      });
                    },
                  ),
                  Divider(color: AppColors.inputBorder, thickness: 1.w),
                  getCheckBox(
                    val: _chk2,
                    title: 'Contacted customer / building manager',
                    onChanged: (value) {
                      setState(() {
                        _chk2 = value ?? false;
                      });
                    },
                  ),
                  Divider(color: AppColors.inputBorder, thickness: 1.w),
                  getCheckBox(
                    val: _chk3,
                    title: 'Reviewed job details and equipment info',
                    onChanged: (value) {
                      setState(() {
                        _chk3 = value ?? false;
                      });
                    },
                  ),
                  Divider(color: AppColors.inputBorder, thickness: 1.w),
                  getCheckBox(
                    val: _chk4,
                    title: 'Safety gear donned (PPE check)',
                    onChanged: (value) {
                      setState(() {
                        _chk4 = value ?? false;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            CustomButtonWidget(
              title: 'Begin Service Work',
              onTap: (_chk1 && _chk2 && _chk3 && _chk4)
                  ? () {
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.trackingProgress,
                      );
                    }
                  : null,
            ),
            SizedBox(height: 16.h),
            Center(
              child: Text(
                'Complete all pre-work checks to proceed',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: .w400,
                  color: const Color(0xFFAAAAAA),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
