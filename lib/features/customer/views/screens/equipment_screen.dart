import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:texafrost/core/widgets/custom_app_bar_back.dart';
import '../../../../core/constants/app_colors.dart';

class EquipmentScreen extends StatelessWidget {
  const EquipmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomAppBarBack(title: 'Equipment'),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                    SizedBox(height: 10.h),

                    // Primary Unit Header[cite: 19]
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: const Color(0xFF131418),
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.06),
                          width: 1,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'PRIMARY UNIT',
                            style: TextStyle(
                              color: AppColors.orangeStart,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.8,
                            ),
                          ),
                          SizedBox(height: 6.h),
                          Text(
                            'Carrier Rooftop Unit (RTU)',
                            style: TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            'Carrier 48XC2060600',
                            style: TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 13.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 18.h),

                    // Specifications Table[cite: 19]
                    _buildSectionHeader('SPECIFICATIONS'),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xFF131418),
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.06),
                          width: 1,
                        ),
                      ),
                      child: Column(
                        children: [
                          _buildSpecRow('Model', 'Carrier 48XC2060600'),
                          _buildDivider(),
                          _buildSpecRow('Serial Number', 'CRU-2019-TX-00847'),
                          _buildDivider(),
                          _buildSpecRow('Installation Date', 'Mar 14, 2019'),
                          _buildDivider(),
                          _buildSpecRow('Last Serviced', 'Jun 12, 2024'),
                          _buildDivider(),
                          _buildSpecRow('Refrigerant Type', 'R-410A'),
                          _buildDivider(),
                          _buildSpecRow('Cooling Capacity', '5 Tons (60,000 BTU)'),
                          _buildDivider(),
                          _buildSpecRow('Voltage', '208/230V Single Phase'),
                          _buildDivider(),
                          _buildSpecRow('Warranty Status', 'Out of Warranty'),
                        ],
                      ),
                    ),
                    SizedBox(height: 18.h),

                    // Recent Readings[cite: 19]
                    _buildSectionHeader('RECENT READINGS'),
                    Row(
                      children: [
                        Expanded(
                          child: _buildReadingCard('Suction Pressure', 'PSI'),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: _buildReadingCard('Discharge Pressure', 'PSI'),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    Row(
                      children: [
                        Expanded(
                          child: _buildReadingCard('Supply Air Temp', '°F'),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: _buildReadingCard('Return Air Temp', '°F'),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: EdgeInsets.only(left: 4.w, bottom: 8.h),
      child: Text(
        title,
        style: TextStyle(
          color: const Color(0xFF6B7280),
          fontSize: 11.sp,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.8,
        ),
      ),
    );
  }

  Widget _buildDivider() =>
      Divider(height: 1, thickness: 1, color: Colors.white.withOpacity(0.04));

  Widget _buildSpecRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: const Color(0xFF6B7280),
              fontSize: 13.sp,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 13.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReadingCard(String title, String unit) {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: const Color(0xFF131418),
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(
          color: Colors.white.withOpacity(0.06),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: const Color(0xFF6B7280),
              fontSize: 12.sp,
            ),
          ),
          SizedBox(height: 14.h),
          Text(
            '—',
            style: TextStyle(
              color: const Color(0xFF3F3F46),
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            unit,
            style: TextStyle(
              color: const Color(0xFF6B7280),
              fontSize: 11.sp,
            ),
          ),
        ],
      ),
    );
  }
}