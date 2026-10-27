import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:texafrost/core/constants/app_colors.dart';
import 'package:texafrost/core/theme/app_decoration.dart';
import 'package:texafrost/core/widgets/custom_app_bar_back.dart';

class PartMaterialScreen extends StatelessWidget {
  const PartMaterialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarBack(title: 'Parts & Materials'),
      body: Padding(
        padding: EdgeInsets.all(17.0.w),
        child: Column(
          children: [
            Container(
              padding: .all(10.r),
              decoration: AppDecorations.container,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Item',
                        style: TextStyle(
                          fontSize: 11.sp,
                          fontWeight: .w600,
                          color: AppColors.labelText,
                        ),
                      ),

                      Spacer(),
                      Text(
                        'QtyUnitTotal',
                        style: TextStyle(
                          fontSize: 11.sp,
                          fontWeight: .w600,
                          color: AppColors.labelText,
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
