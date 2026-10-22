import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:texafrost/features/dashboard/models/dashboard_summary_model.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/custom_bottom_nav_bar.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dashboardProvider = context.watch<DashboardProvider>();

    final List<Widget> screens = const [
      Center(child: Text('Jobs Screen', style: TextStyle(color: Colors.white))),
      Center(child: Text('Schedule Screen', style: TextStyle(color: Colors.white))),
      Center(child: Text('Sync Screen', style: TextStyle(color: Colors.white))),
      Center(child: Text('Profile Screen', style: TextStyle(color: Colors.white))),
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: IndexedStack(
        index: dashboardProvider.currentIndex,
        children: screens,
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: dashboardProvider.currentIndex,
        jobsBadgeCount: dashboardProvider.unreadJobsCount,
        onTap: (index) {
          context.read<DashboardProvider>().changeTab(index);
        },
      ),
    );
  }
}