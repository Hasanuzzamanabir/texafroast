import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:texafrost/core/constants/app_colors.dart';

Widget getCheckBox({
  required bool val,
  required String title,
  required ValueChanged<bool?> onChanged,
}) {
  return Material(
    type: MaterialType.transparency,
    child: CheckboxListTile(
      value: val,
      onChanged: onChanged,
      title: Text(
        title,
        style: TextStyle(
          color: AppColors.labelText,
          decoration: val ? TextDecoration.lineThrough : null,
          decorationColor: AppColors.textSecondary,
          decorationThickness: 2.w,
        ),
      ),
      controlAffinity: ListTileControlAffinity.leading,
      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
      activeColor: Colors.green,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      fillColor: val ? WidgetStateProperty.all(AppColors.orangeEnd) : null,
      checkboxShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2.r),
      ),
    ),
  );
}
