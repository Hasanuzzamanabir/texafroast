import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:signature/signature.dart';
import 'package:texafrost/core/constants/app_colors.dart';
import 'package:texafrost/core/widgets/custom_app_bar_back.dart';
import 'package:texafrost/core/widgets/custom_button.dart';
import 'package:texafrost/features/jobs/view_models/job_tracking_view_model.dart';
import 'package:texafrost/features/jobs/views/widgets/custom_stepper_widget.dart';

class CustomerSignatureScreen extends StatefulWidget {
  const CustomerSignatureScreen({super.key});

  @override
  State<CustomerSignatureScreen> createState() =>
      _CustomerSignatureScreenState();
}

class _CustomerSignatureScreenState extends State<CustomerSignatureScreen> {
  late final SignatureController _signatureController;
  bool _agreed = true;

  @override
  void initState() {
    super.initState();
    _signatureController = SignatureController(
      penStrokeWidth: 2.5,
      penColor: AppColors.textPrimary,
      exportBackgroundColor: Colors.transparent,
    );
    _signatureController.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _signatureController.dispose();
    super.dispose();
  }

  void _clearSignature() {
    _signatureController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBarBack(title: 'Customer Signature'),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomStepper(currentStep: 6),
            SizedBox(height: 14.h),

            // Service Acknowledgment Card
            Container(
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: AppColors.cardBorder, width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Service Acknowledgment',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.labelText,
                      letterSpacing: 0.5,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        height: 1.5,
                        color: AppColors.labelText,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      text: 'By signing below, ',
                      children: [
                        TextSpan(
                          text: 'Riverside Office Complex',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const TextSpan(
                          text:
                              ' confirms that the described service work has been completed to satisfaction, and authorizes PROTRA to process payment per the agreed terms.',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),

            // Signature Pad Container using package:signature
            Container(
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: AppColors.cardBorder, width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'SIGNATURE',
                        style: TextStyle(
                          fontSize: 11.5.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.labelText,
                          letterSpacing: 0.5,
                        ),
                      ),
                      TextButton.icon(
                        onPressed: _clearSignature,
                        icon: Icon(
                          Icons.refresh_rounded,
                          size: 16.sp,
                          color: AppColors.orangeStart,
                        ),
                        label: Text(
                          'Clear',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.orangeStart,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 4.h,
                          ),
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),

                  // Signature Drawing Canvas
                  Container(
                    width: double.infinity,
                    height: 180.h,
                    decoration: BoxDecoration(
                      color: AppColors.inputBackground,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                        color: AppColors.cardBorder,
                        style: BorderStyle.solid,
                      ),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Stack(
                      children: [
                        Signature(
                          controller: _signatureController,
                          height: 180.h,
                          width: double.infinity,
                          backgroundColor: AppColors.inputBackground,
                        ),
                        if (_signatureController.isEmpty)
                          IgnorePointer(
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.draw_outlined,
                                    size: 24.sp,
                                    color: AppColors.textSecondary.withValues(
                                      alpha: 0.5,
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    'Customer signs here with finger or stylus',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: AppColors.textSecondary.withValues(
                                        alpha: 0.7,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12.h),

                  // Acknowledgment Checkbox
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 24.w,
                        height: 24.h,
                        child: Checkbox(
                          value: _agreed,
                          activeColor: AppColors.orangeStart,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          onChanged: (val) {
                            setState(() {
                              _agreed = val ?? false;
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: Text(
                          'Customer agrees to the completed work and authorizes PROTRA to process payment.',
                          style: TextStyle(
                            fontSize: 11.5.sp,
                            color: AppColors.textSecondary,
                            height: 1.35,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),

            // Submit Button
            CustomButtonWidget(
              title: 'Confirm Signature & Generate Report',
              type: ButtonType.orange,
              onTap: _agreed && _signatureController.isNotEmpty
                  ? () {
                      context.read<JobTrackingViewModel>().changeStepStatus(
                        index: 5,
                        value: true,
                      );

                      Navigator.pop(context);
                    }
                  : null,
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
