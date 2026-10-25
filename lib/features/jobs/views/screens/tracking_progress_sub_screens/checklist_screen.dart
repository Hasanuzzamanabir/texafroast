import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:texafrost/core/widgets/custom_app_bar_back.dart';
import 'package:texafrost/features/jobs/models/step_model.dart';
import 'package:texafrost/features/jobs/views/widgets/custom_stepper_widget.dart';

class ChecklistScreen extends StatelessWidget {
  ChecklistScreen({super.key});
  final steps = [
    StepItem('Check'),
    StepItem('Diag'),
    StepItem('Notes'),
    StepItem('Photos'),
    StepItem('Parts'),
    StepItem('Sign'),
    StepItem('Report'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarBack(title: 'Checklist'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 17.w),
          child: Column(
            children: [
              CustomStepper(
                steps: steps,
                currentStep: 2, // Diag selected
              ),
            ],
          ),
        ),
      ),
    );
  }
}
