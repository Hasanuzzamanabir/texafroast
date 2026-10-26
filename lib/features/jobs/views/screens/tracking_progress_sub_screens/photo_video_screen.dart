import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:texafrost/core/constants/app_colors.dart';
import 'package:texafrost/core/theme/app_decoration.dart';
import 'package:texafrost/core/widgets/custom_app_bar_back.dart';
import 'package:texafrost/core/widgets/custom_button.dart';
import 'package:texafrost/features/jobs/view_models/job_tracking_view_model.dart';
import 'package:texafrost/features/jobs/views/widgets/custom_stepper_widget.dart';

class PhotoVideoScreen extends StatelessWidget {
  const PhotoVideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarBack(title: 'Photos & Videos'),
      body: Padding(
        padding: .symmetric(horizontal: 17.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: .start,
            children: [
              CustomStepper(currentStep: 4),
              SizedBox(height: 16.h),
              Row(
                spacing: 16.w,
                children: [
                  Expanded(
                    child: Container(
                      padding: .all(20.r),
                      decoration: AppDecorations.container,
                      child: Column(
                        children: [
                          Icon(
                            Icons.camera_alt_outlined,
                            size: 30.r,
                            color: AppColors.labelText,
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            'Take Photo',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: .w600,
                              color: AppColors.labelText,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: .all(20.r),
                      decoration: AppDecorations.container,
                      child: Column(
                        children: [
                          Icon(
                            Icons.videocam_outlined,
                            size: 30.r,
                            color: AppColors.labelText,
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            'Record Video',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: .w600,
                              color: AppColors.labelText,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32.h),
              Text(
                'BEFORE (2)',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: .w700,
                  color: AppColors.labelText,
                ),
              ),
              SizedBox(height: 8.h),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8.h,
                  crossAxisSpacing: 8.w,
                ),
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Positioned.fill(
                        child: Container(
                          padding: .all(20.r),
                          decoration: AppDecorations.container,
                          child: Icon(
                            Icons.camera_alt_outlined,
                            size: 30.r,
                            color: AppColors.labelText,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 8.w,
                        top: 8.h,
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            padding: .all(4.r),
                            decoration: BoxDecoration(
                              color: Colors.red.withValues(alpha: .3),
                              borderRadius: .circular(6.r),
                            ),
                            child: Icon(
                              Icons.delete_outline,
                              size: 20.r,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
                itemCount: 2,
              ),
              SizedBox(height: 27.h),
              Text(
                'AFTER (1)',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: .w700,
                  color: AppColors.labelText,
                ),
              ),
              SizedBox(height: 8.h),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8.h,
                  crossAxisSpacing: 8.w,
                ),
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Positioned.fill(
                        child: Container(
                          padding: .all(20.r),
                          decoration: AppDecorations.container,
                          child: Icon(
                            Icons.camera_alt_outlined,
                            size: 30.r,
                            color: AppColors.labelText,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 8.w,
                        top: 8.h,
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            padding: .all(4.r),
                            decoration: BoxDecoration(
                              color: Colors.red.withValues(alpha: .3),
                              borderRadius: .circular(6.r),
                            ),
                            child: Icon(
                              Icons.delete_outline,
                              size: 20.r,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
                itemCount: 1,
              ),
              SizedBox(height: 32.h),
              CustomButtonWidget(
                title: 'Save & Continue',
                onTap: () {
                  context.read<JobTrackingViewModel>().changeStepStatus(
                    index: 3,
                    value: true,
                  );
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
