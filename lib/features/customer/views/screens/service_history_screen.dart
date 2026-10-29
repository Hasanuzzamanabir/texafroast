import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:texafrost/core/widgets/custom_app_bar_back.dart';
import '../../../../core/constants/app_colors.dart';

class ServiceHistoryScreen extends StatelessWidget {
  const ServiceHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final historyLogs = [
      {
        'title': 'Preventive Maintenance',
        'date': 'Jun 12, 2024',
        'desc': 'Replaced filter, cleaned coils. System operating normally.',
        'tech': 'Tech: D. Martinez',
        'rating': 5,
      },
      {
        'title': 'Emergency Repair',
        'date': 'Feb 08, 2024',
        'desc': 'Capacitor failed. Replaced dual run capacitor 45/7.5 MFD.',
        'tech': 'Tech: R. Johnson',
        'rating': 5,
      },
      {
        'title': 'AC Tune-Up',
        'date': 'Oct 15, 2023',
        'desc': 'Refrigerant slightly low. Added 1 lb R-410A. Filter replaced.',
        'tech': 'Tech: D. Martinez',
        'rating': 5,
      },
      {
        'title': 'Preventive Maintenance',
        'date': 'Jun 20, 2023',
        'desc': 'All systems nominal. Condensate drain cleared.',
        'tech': 'Tech: M. Thompson',
        'rating': 5,
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomAppBarBack(title: 'Service History'),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 10.h),

                    // Top Summary Cards (12 Visits / 4.9 Rating)[cite: 18]
                    Row(
                      children: [
                        Expanded(
                          child: _buildSummaryCard('12', 'TOTAL VISITS', AppColors.orangeStart),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: _buildSummaryCard('4.9', 'AVG RATING', const Color(0xFF22C55E)),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),

                    // History Cards List[cite: 18]
                    ...historyLogs.map(
                      (item) => Container(
                        margin: EdgeInsets.only(bottom: 12.h),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  item['title'] as String,
                                  style: TextStyle(
                                    color: AppColors.orangeStart,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  item['date'] as String,
                                  style: TextStyle(
                                    color: const Color(0xFF6B7280),
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 6.h),
                            Text(
                              item['desc'] as String,
                              style: TextStyle(
                                color: AppColors.textPrimary,
                                fontSize: 13.sp,
                                height: 1.3,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  item['tech'] as String,
                                  style: TextStyle(
                                    color: const Color(0xFF6B7280),
                                    fontSize: 12.sp,
                                  ),
                                ),
                                Row(
                                  children: List.generate(
                                    item['rating'] as int,
                                    (i) => Icon(
                                      Icons.star_rounded,
                                      size: 14.sp,
                                      color: AppColors.orangeStart,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                  ],
                ),
              ),
    );
  }

  Widget _buildSummaryCard(String val, String title, Color valColor) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 18.h),
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
          Text(
            val,
            style: TextStyle(
              color: valColor,
              fontSize: 26.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            title,
            style: TextStyle(
              color: const Color(0xFF6B7280),
              fontSize: 10.sp,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.8,
            ),
          ),
        ],
      ),
    );
  }
}