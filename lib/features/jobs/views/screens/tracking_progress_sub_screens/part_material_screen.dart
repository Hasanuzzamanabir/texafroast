import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:texafrost/core/constants/app_colors.dart';
import 'package:texafrost/core/widgets/custom_app_bar_back.dart';
import 'package:texafrost/core/widgets/custom_button.dart';
import 'package:texafrost/features/jobs/view_models/job_tracking_view_model.dart';
import 'package:texafrost/features/jobs/views/widgets/custom_stepper_widget.dart';

class PartItem {
  final String id;
  final String name;
  final String code;
  final double unitPrice;
  int quantity;

  PartItem({
    required this.id,
    required this.name,
    required this.code,
    required this.unitPrice,
    this.quantity = 1,
  });

  double get total => unitPrice * quantity;
}

class PartMaterialScreen extends StatefulWidget {
  const PartMaterialScreen({super.key});

  @override
  State<PartMaterialScreen> createState() => _PartMaterialScreenState();
}

class _PartMaterialScreenState extends State<PartMaterialScreen> {
  final List<PartItem> _parts = [
    PartItem(
      id: '1',
      name: 'Air Filter 16×25×1 MERV-11',
      code: 'FLT-16x25x1',
      unitPrice: 12.50,
      quantity: 1,
    ),
    PartItem(
      id: '2',
      name: 'Condensate Pan Tablets (25-pack)',
      code: 'DRN-TAB-25',
      unitPrice: 9.50,
      quantity: 1,
    ),
  ];

  double get _partsTotal {
    return _parts.fold(0.0, (sum, item) => sum + item.total);
  }

  void _incrementQty(int index) {
    setState(() {
      _parts[index].quantity++;
    });
  }

  void _decrementQty(int index) {
    if (_parts[index].quantity > 1) {
      setState(() {
        _parts[index].quantity--;
      });
    } else {
      _confirmRemoveItem(index);
    }
  }

  void _confirmRemoveItem(int index) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.r),
        ),
        title: Text(
          'Remove Item?',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        content: Text(
          'Do you want to remove "${_parts[index].name}" from this job?',
          style: TextStyle(
            fontSize: 13.sp,
            color: AppColors.textSecondary,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(
              'Cancel',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(ctx);
              setState(() {
                _parts.removeAt(index);
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.redStart,
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            child: const Text('Remove'),
          ),
        ],
      ),
    );
  }

  void _showAddPartBottomSheet() {
    final List<PartItem> availablePresets = [
      PartItem(
        id: 'p1',
        name: 'Run Capacitor 45/5 MFD 440V',
        code: 'CAP-455-440',
        unitPrice: 28.00,
      ),
      PartItem(
        id: 'p2',
        name: 'Contactor 2-Pole 30A 24V',
        code: 'CNT-2P-30A',
        unitPrice: 24.50,
      ),
      PartItem(
        id: 'p3',
        name: 'R-410A Refrigerant (per lb)',
        code: 'REF-R410A',
        unitPrice: 35.00,
      ),
      PartItem(
        id: 'p4',
        name: 'Thermostat Wire 18/5 (50ft)',
        code: 'WIR-18-5',
        unitPrice: 22.00,
      ),
      PartItem(
        id: 'p5',
        name: 'Transformer 40VA 120/240 to 24V',
        code: 'TRN-40VA',
        unitPrice: 32.00,
      ),
    ];

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (ctx) {
        return DraggableScrollableSheet(
          initialChildSize: 0.7,
          minChildSize: 0.5,
          maxChildSize: 0.9,
          expand: false,
          builder: (context, scrollController) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 40.w,
                      height: 4.h,
                      decoration: BoxDecoration(
                        color: AppColors.cardBorder,
                        borderRadius: BorderRadius.circular(2.r),
                      ),
                    ),
                  ),
                  SizedBox(height: 14.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Select Part / Material',
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w800,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.pop(ctx),
                        icon: const Icon(Icons.close_rounded),
                        color: AppColors.textSecondary,
                      ),
                    ],
                  ),
                  Text(
                    'Choose a frequently used part or add a custom one',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Expanded(
                    child: ListView.separated(
                      controller: scrollController,
                      itemCount: availablePresets.length,
                      separatorBuilder: (_, _) => Divider(
                        color: AppColors.cardBorder,
                        height: 1,
                      ),
                      itemBuilder: (context, idx) {
                        final preset = availablePresets[idx];
                        return ListTile(
                          contentPadding: EdgeInsets.symmetric(vertical: 4.h),
                          title: Text(
                            preset.name,
                            style: TextStyle(
                              fontSize: 13.5.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          subtitle: Text(
                            '${preset.code} · \$${preset.unitPrice.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: AppColors.textSecondary,
                            ),
                          ),
                          trailing: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(ctx);
                              setState(() {
                                _parts.add(
                                  PartItem(
                                    id: DateTime.now().millisecondsSinceEpoch.toString(),
                                    name: preset.name,
                                    code: preset.code,
                                    unitPrice: preset.unitPrice,
                                    quantity: 1,
                                  ),
                                );
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.orangeLight,
                              foregroundColor: AppColors.orangeStart,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                                side: BorderSide(color: AppColors.orangeBorder),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 12.w,
                                vertical: 6.h,
                              ),
                            ),
                            child: const Text('Add'),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBarBack(title: 'Parts & Materials'),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomStepper(currentStep: 5),
            SizedBox(height: 14.h),

            // Card Container
            Container(
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: AppColors.cardBorder, width: 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.02),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // 1. Table Header
                  Padding(
                    padding: EdgeInsets.fromLTRB(14.w, 14.h, 14.w, 10.h),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Item',
                            style: TextStyle(
                              fontSize: 11.5.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.labelText,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 76.w,
                          child: Text(
                            'Qty',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 11.5.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.labelText,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 52.w,
                          child: Text(
                            'Unit',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 11.5.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.labelText,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 62.w,
                          child: Text(
                            'Total',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 11.5.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.labelText,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(color: AppColors.cardBorder, height: 1),

                  // 2. Parts Items List
                  if (_parts.isEmpty)
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 24.h),
                      child: Center(
                        child: Text(
                          'No parts added yet.',
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ),
                    )
                  else
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _parts.length,
                      separatorBuilder: (_, _) => Divider(
                        color: AppColors.cardBorder,
                        height: 1,
                      ),
                      itemBuilder: (context, index) {
                        final item = _parts[index];
                        return Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 14.w,
                            vertical: 12.h,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Left: Name & Code
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.name,
                                      style: TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.textPrimary,
                                        height: 1.25,
                                      ),
                                    ),
                                    SizedBox(height: 3.h),
                                    Text(
                                      item.code,
                                      style: TextStyle(
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.textSecondary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 8.w),

                              // Stepper: [-] qty [+]
                              SizedBox(
                                width: 76.w,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    _buildStepperButton(
                                      icon: Icons.remove,
                                      onTap: () => _decrementQty(index),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 6.w,
                                      ),
                                      child: Text(
                                        '${item.quantity}',
                                        style: TextStyle(
                                          fontSize: 13.5.sp,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.textPrimary,
                                        ),
                                      ),
                                    ),
                                    _buildStepperButton(
                                      icon: Icons.add,
                                      onTap: () => _incrementQty(index),
                                    ),
                                  ],
                                ),
                              ),

                              // Unit Price
                              SizedBox(
                                width: 52.w,
                                child: Text(
                                  '\$${item.unitPrice.toStringAsFixed(2)}',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                              ),

                              // Total Price
                              SizedBox(
                                width: 62.w,
                                child: Text(
                                  '\$${item.total.toStringAsFixed(2)}',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 13.5.sp,
                                    fontWeight: FontWeight.w800,
                                    color: AppColors.orangeStart,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),

                  Divider(color: AppColors.cardBorder, height: 1),

                  // 3. Parts Total Footer
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.w,
                      vertical: 14.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceLight,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16.r),
                        bottomRight: Radius.circular(16.r),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Parts Total',
                          style: TextStyle(
                            fontSize: 15.5.sp,
                            fontWeight: FontWeight.w800,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        Text(
                          '\$${_partsTotal.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 19.sp,
                            fontWeight: FontWeight.w900,
                            color: AppColors.orangeStart,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),

            // + Add Part / Material Button with Dashed Border
            CustomPaint(
              painter: DashedBorderPainter(
                color: AppColors.orangeStart,
                strokeWidth: 1.5,
                radius: 14.r,
                dashWidth: 6,
                dashGap: 4,
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: _showAddPartBottomSheet,
                  borderRadius: BorderRadius.circular(14.r),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                    decoration: BoxDecoration(
                      color: AppColors.orangeLight.withValues(alpha: 0.35),
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_rounded,
                          color: AppColors.orangeStart,
                          size: 20.sp,
                        ),
                        SizedBox(width: 6.w),
                        Text(
                          'Add Part / Material',
                          style: TextStyle(
                            color: AppColors.orangeStart,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.h),

            // Save & Continue Action Button
            CustomButtonWidget(
              title: 'Save & Continue',
              type: ButtonType.orange,
              onTap: () {
                context.read<JobTrackingViewModel>().changeStepStatus(
                  index: 4,
                  value: true,
                );
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }

  Widget _buildStepperButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(6.r),
        child: Container(
          width: 24.w,
          height: 24.h,
          decoration: BoxDecoration(
            color: AppColors.surfaceLight,
            borderRadius: BorderRadius.circular(6.r),
            border: Border.all(
              color: AppColors.cardBorder,
              width: 1,
            ),
          ),
          alignment: Alignment.center,
          child: Icon(
            icon,
            size: 13.sp,
            color: AppColors.textPrimary,
          ),
        ),
      ),
    );
  }
}

class DashedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double radius;
  final double dashWidth;
  final double dashGap;

  const DashedBorderPainter({
    required this.color,
    this.strokeWidth = 1.5,
    this.radius = 14,
    this.dashWidth = 5,
    this.dashGap = 3,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(
            strokeWidth / 2,
            strokeWidth / 2,
            size.width - strokeWidth,
            size.height - strokeWidth,
          ),
          Radius.circular(radius),
        ),
      );

    final pathMetrics = path.computeMetrics();
    for (final metric in pathMetrics) {
      double distance = 0.0;
      while (distance < metric.length) {
        final double end = (distance + dashWidth).clamp(0.0, metric.length);
        canvas.drawPath(metric.extractPath(distance, end), paint);
        distance += dashWidth + dashGap;
      }
    }
  }

  @override
  bool shouldRepaint(covariant DashedBorderPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.radius != radius ||
        oldDelegate.dashWidth != dashWidth ||
        oldDelegate.dashGap != dashGap;
  }
}
