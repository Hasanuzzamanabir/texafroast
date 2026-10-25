import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:texafrost/core/constants/app_colors.dart';
import 'package:texafrost/features/jobs/models/step_model.dart';

class CustomStepper extends StatelessWidget {
  final List<StepItem> steps;
  final int currentStep;

  const CustomStepper({
    super.key,
    required this.steps,
    required this.currentStep,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        steps.length,
        (index) => Expanded(
          child: _StepWidget(
            index: index,
            currentStep: currentStep,
            title: steps[index].title,
            isLast: index == steps.length - 1,
          ),
        ),
      ),
    );
  }
}

class _StepWidget extends StatelessWidget {
  final int index;
  final int currentStep;
  final String title;
  final bool isLast;

  const _StepWidget({
    required this.index,
    required this.currentStep,
    required this.title,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    final bool isCurrent = index == currentStep - 1;
    final bool isCompleted = index < currentStep - 1;

    return Column(
      crossAxisAlignment: .start,
      children: [
        Row(
          children: [
            _buildCircle(
              isCompleted: isCompleted,
              isCurrent: isCurrent,
              stepNumber: index + 1,
            ),

            if (!isLast)
              Expanded(
                child: Container(
                  height: 3,
                  color: isCompleted ? Colors.green : const Color(0xFF2A2A2A),
                ),
              ),
          ],
        ),

        const SizedBox(height: 10),

        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 8.sp,
            fontWeight: FontWeight.w600,
            color: isCompleted
                ? AppColors.greenStart
                : isCurrent
                ? Colors.orange
                : Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildCircle({
    required bool isCompleted,
    required bool isCurrent,
    required int stepNumber,
  }) {
    Color color;

    if (isCompleted) {
      color = Colors.green;
    } else if (isCurrent) {
      color = Colors.orange;
    } else {
      color = const Color(0xFF23242D);
    }

    return Container(
      width: 22.w,
      height: 22.h,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: color.withOpacity(.3)),
      ),
      child: Center(
        child: isCompleted
            ? const Icon(Icons.check, size: 18, color: Colors.white)
            : Text(
                '$stepNumber',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }
}
