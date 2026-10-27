import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:texafrost/core/constants/app_colors.dart';
import 'package:texafrost/core/widgets/custom_app_bar_back.dart';
import 'package:texafrost/core/widgets/custom_button.dart';
import 'package:texafrost/features/jobs/views/widgets/custom_stepper_widget.dart';
import 'package:texafrost/routes/app_routes.dart';

class JobReportScreen extends StatelessWidget {
  const JobReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarBack(title: 'Service Report'),
      body: SingleChildScrollView(
        child: Padding(
          padding: .symmetric(horizontal: 17.w),
          child: Column(
            children: [
              SizedBox(height: 24.h),
              CustomStepper(currentStep: 7),
              SizedBox(height: 15.h),
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: AppColors.orangeStart, width: 1.5),
                  color: AppColors.surface,
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 16.h,
                      ),
                      decoration: const BoxDecoration(
                        color: AppColors.orangeStart,
                      ),
                        child: Column(
                          crossAxisAlignment: .start,
                          children: [
                            Row(
                              mainAxisAlignment: .spaceBetween,
                              children: [
                                Text(
                                  'SERVICE REPORT',
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    fontWeight: .w800,
                                    color: AppColors.inputBackground,
                                  ),
                                ),
                                Text(
                                  'RPT-047-7655',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: .w400,
                                    color: AppColors.inputBackground,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              'PROTRA HVAC',
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: .w900,
                                color: AppColors.inputBackground,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Padding(
                        padding: .symmetric(horizontal: 10.w),
                        child: Column(
                          children: [
                            _buildInfoRow(
                              label: 'Customer',
                              value: 'Riverside Office Complex',
                            ),
                            _buildInfoRow(
                              label: 'Location',
                              value: '123 Main St, Anytown, USA',
                            ),
                            _buildInfoRow(
                              label: 'Service Type',
                              value: 'Installation',
                            ),
                            _buildInfoRow(
                              label: 'Equipment',
                              value:
                                  'Carrier Rooftop Unit (RTU) (Carrier 48XC2060600)',
                            ),
                            _buildInfoRow(
                              label: 'Serial Number',
                              value: 'CRU-2019-TX-008470',
                            ),
                            _buildInfoRow(
                              label: 'Job Date',
                              value: '2023-02-14 09:30:00',
                            ),
                            _buildInfoRow(
                              isDivider: false,
                              label: 'Technician',
                              value: 'David Martinez — Cert. HVAC Tech',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Container(
                        padding: .all(16.r),
                        width: .maxFinite,
                        decoration: BoxDecoration(color: AppColors.cardBorder),
                        child: Column(
                          crossAxisAlignment: .start,
                          children: [
                            Text(
                              'WORK PERFORMED',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: .w700,
                                color: AppColors.orangeStart,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) => Row(
                                spacing: 10.w,
                                crossAxisAlignment: .center,
                                children: [
                                  Icon(Icons.circle, size: 8.r),
                                  Expanded(
                                    child: Text(
                                      'Preventive maintenance performed on Carrier 48XC rooftop unit',
                                    ),
                                  ),
                                ],
                              ),
                              separatorBuilder: (context, index) =>
                                  SizedBox(height: 8.h),
                              itemCount: 3,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 10.h,
                        ),
                        child: Row(
                          mainAxisAlignment: .spaceBetween,
                          children: [
                            Text(
                              'Parts Total',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: .w400,
                              ),
                            ),
                            Text(
                              '\$22.03',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: .w800,
                                color: AppColors.orangeStart,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: .all(10.r),
                        decoration: BoxDecoration(
                          color: AppColors.lightGrayBorder,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: .spaceBetween,
                              children: [
                                Text('Customer Signature'),
                                Text('Status'),
                              ],
                            ),
                            SizedBox(height: 6.h),
                            Row(
                              mainAxisAlignment: .spaceBetween,
                              children: [
                                Text(
                                  '✓ Signed digitally',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: .w500,
                                    color: AppColors.greenStart,
                                  ),
                                ),
                                Text(
                                  'APPROVED',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: .w800,
                                    color: AppColors.greenStart,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Row(
                          spacing: 16.w,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: .circular(6.r),
                                  ),
                                  side: BorderSide(color: AppColors.cardBorder),
                                  backgroundColor: AppColors.background,
                                  foregroundColor: AppColors.textPrimary,
                                ),
                                onPressed: () {},
                                child: Text('Share Report'),
                              ),
                            ),
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: .circular(6.r),
                                  ),
                                  side: BorderSide(color: AppColors.cardBorder),
                                  backgroundColor: AppColors.background,
                                  foregroundColor: AppColors.textPrimary,
                                ),
                                onPressed: () {},
                                child: Text('Email to Customer'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: .all(12.r),
                        child: CustomButtonWidget(
                          title: 'Complete Job',
                          onTap: () => Navigator.pushNamed(
                            context,
                            AppRoutes.jobComplete,
                          ),
                        ),
                      ),
                      SafeArea(child: const SizedBox.shrink()),
                    ],
                  ),
                ),
                SizedBox(height: 50.h),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildInfoRow({
  required String label,
  required String value,
  bool isDivider = true,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 5.h),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Expanded(
              child: Text(
                label,
                style: TextStyle(fontSize: 12.sp, fontWeight: .w400),
              ),
            ),
            Expanded(
              child: Text(
                value,
                style: TextStyle(fontSize: 12.sp, fontWeight: .w600),
              ),
            ),
          ],
        ),
        if (isDivider) Divider(),
      ],
    ),
  );
}
