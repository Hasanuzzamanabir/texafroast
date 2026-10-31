import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:texafrost/core/constants/app_colors.dart';

class PinKeypadWidget extends StatelessWidget {
  const PinKeypadWidget({
    super.key,
    required this.onKeyPressed,
    required this.onBackspace,
  });

  final ValueChanged<String> onKeyPressed;
  final VoidCallback onBackspace;

  @override
  Widget build(BuildContext context) {
    const keypadData = [
      {'number': '1', 'letters': 'ABC'},
      {'number': '2', 'letters': 'DEF'},
      {'number': '3', 'letters': 'GHI'},
      {'number': '4', 'letters': 'JKL'},
      {'number': '5', 'letters': 'MNO'},
      {'number': '6', 'letters': 'PQRS'},
      {'number': '7', 'letters': 'TUV'},
      {'number': '8', 'letters': 'WXYZ'},
      {'number': '9', 'letters': ''},
    ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int row = 0; row < 3; row++) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int col = 0; col < 3; col++) ...[
                _buildKeyButton(
                  number: keypadData[row * 3 + col]['number']!,
                  letters: keypadData[row * 3 + col]['letters']!,
                  onTap: () =>
                      onKeyPressed(keypadData[row * 3 + col]['number']!),
                ),
                if (col < 2) SizedBox(width: 14.w),
              ],
            ],
          ),
          SizedBox(height: 14.h),
        ],
        // 4th Row: Empty / 0 / Backspace
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 74.w, height: 74.h), // Empty left slot
            SizedBox(width: 14.w),
            _buildKeyButton(
              number: '0',
              letters: '',
              onTap: () => onKeyPressed('0'),
            ),
            SizedBox(width: 14.w),
            _buildActionKeyButton(
              icon: Icons.backspace_outlined,
              onTap: onBackspace,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildKeyButton({
    required String number,
    required String letters,
    required VoidCallback onTap,
  }) {
    return Container(
      width: 74.w,
      height: 74.h,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(22.r),
        border: Border.all(color: AppColors.lightGrayBorder, width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(22.r),
          onTap: onTap,
          splashColor: AppColors.orangeStart.withValues(alpha: 0.12),
          highlightColor: AppColors.orangeStart.withValues(alpha: 0.06),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                number,
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                  height: 1.1,
                ),
              ),
              if (letters.isNotEmpty) ...[
                SizedBox(height: 2.h),
                Text(
                  letters,
                  style: TextStyle(
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.8,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionKeyButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Container(
      width: 74.w,
      height: 74.h,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(22.r),
        border: Border.all(color: AppColors.lightGrayBorder, width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(22.r),
          onTap: onTap,
          splashColor: AppColors.orangeStart.withValues(alpha: 0.12),
          highlightColor: AppColors.orangeStart.withValues(alpha: 0.06),
          child: Center(
            child: Icon(icon, size: 22.sp, color: AppColors.textPrimary),
          ),
        ),
      ),
    );
  }
}
