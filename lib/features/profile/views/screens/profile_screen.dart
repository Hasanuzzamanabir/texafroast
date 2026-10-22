import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:texafrost/features/profile/views/screens/widgets/profile_header_card.dart';
import 'package:texafrost/features/profile/views/screens/widgets/profile_tab_bar.dart';
import 'package:texafrost/features/profile/views/screens/widgets/settings_item_tile.dart';
import '../../../../core/constants/app_colors.dart';
import '../../view_models/profile_view_model.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profileVm = context.watch<ProfileViewModel>();
    final profile = profileVm.profile;

    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),
            Text(
              'My Profile',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 22.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 16.h),

            // Top Header Card[cite: 16, 17, 18]
            ProfileHeaderCard(profile: profile),
            SizedBox(height: 16.h),

            // Profile / Stats / Settings Tabs[cite: 16, 17, 18]
            ProfileTabBar(
              selectedIndex: profileVm.selectedTabIndex,
              onTabSelected: (index) => profileVm.selectTab(index),
            ),
            SizedBox(height: 20.h),

            // Tab 0: Profile View[cite: 18]
            if (profileVm.selectedTabIndex == 0) ...[
              _buildSectionHeader('CONTACT'),
              _buildCardContainer([
                _buildInfoRow(Icons.phone_outlined, 'Phone', profile.phone),
                _buildDivider(),
                _buildInfoRow(Icons.email_outlined, 'Email', profile.email),
                _buildDivider(),
                _buildInfoRow(Icons.location_on_outlined, 'Base Location', profile.baseLocation),
              ]),
              SizedBox(height: 20.h),

              _buildSectionHeader('CERTIFICATIONS'),
              _buildCardContainer([
                _buildBadgeRow('EPA 608 Universal', 'Expires Dec 2026', 'VALID', const Color(0xFF22C55E)),
                _buildDivider(),
                _buildBadgeRow('NATE HVAC Excellence', 'Expires Mar 2025', 'EXPIRING', AppColors.orangeStart),
                _buildDivider(),
                _buildBadgeRow('OSHA 30-Hour Safety', 'Expires Sep 2027', 'VALID', const Color(0xFF22C55E)),
                _buildDivider(),
                _buildBadgeRow('R-410A Certification', 'Expires Jun 2026', 'VALID', const Color(0xFF22C55E)),
              ]),
              SizedBox(height: 20.h),

              _buildSectionHeader('VEHICLE & EQUIPMENT'),
              _buildCardContainer([
                _buildInfoRow(Icons.build_outlined, 'Service Vehicle', profile.serviceVehicle),
                _buildDivider(),
                _buildInfoRow(Icons.inventory_2_outlined, 'Equipment Kit', profile.equipmentKit),
              ]),
            ],

            // Tab 1: Stats View[cite: 17]
            if (profileVm.selectedTabIndex == 1) ...[
              _buildSectionHeader('PERFORMANCE — SEPTEMBER 2026'),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 10.w,
                mainAxisSpacing: 10.h,
                childAspectRatio: 1.5,
                children: [
                  _buildStatCard('📋', '47', 'Jobs This Month'),
                  _buildStatCard('⭐', '4.9', 'Avg. Rating'),
                  _buildStatCard('⏱️', '98%', 'On-Time Rate'),
                  _buildStatCard('🔧', '100%', 'Parts Accuracy'),
                  _buildStatCard('✅', '91%', 'First-Fix Rate'),
                  _buildStatCard('⏲️', '38.5', 'Hrs This Week'),
                ],
              ),
              SizedBox(height: 20.h),

              _buildSectionHeader('THIS WEEK'),
              _buildCardContainer([
                Padding(
                  padding: EdgeInsets.all(14.w),
                  child: Column(
                    children: [
                      _buildDayBar('Mon', 0.5, '5'),
                      _buildDayBar('Tue', 0.8, '8'),
                      _buildDayBar('Wed', 0.6, '6'),
                      _buildDayBar('Thu', 0.3, '3'),
                      _buildDayBar('Fri', 0.2, '2'),
                      SizedBox(height: 6.h),
                      Text(
                        'Jobs completed per day',
                        style: TextStyle(color: const Color(0xFF71717A), fontSize: 11.sp),
                      ),
                    ],
                  ),
                ),
              ]),
              SizedBox(height: 20.h),

              _buildSectionHeader('CUSTOMER SATISFACTION'),
              _buildCardContainer([
                Padding(
                  padding: EdgeInsets.all(14.w),
                  child: Column(
                    children: [
                      _buildRatingBar('★★★★★', 0.85, '38', const Color(0xFF22C55E)),
                      _buildRatingBar('★★★★', 0.2, '6', const Color(0xFF22C55E)),
                      _buildRatingBar('★★★', 0.08, '2', AppColors.orangeStart),
                      _buildRatingBar('★★', 0.04, '1', const Color(0xFFEF4444)),
                      _buildRatingBar('★', 0.0, '0', const Color(0xFF71717A)),
                    ],
                  ),
                ),
              ]),
            ],

            // Tab 2: Settings View[cite: 16]
            if (profileVm.selectedTabIndex == 2) ...[
              _buildCardContainer([
                SettingsItemTile(
                  leading: Text('🔔', style: TextStyle(fontSize: 16.sp)),
                  title: 'Push Notifications',
                  trailing: _buildCustomSwitch(
                    profileVm.pushNotifications,
                    (val) => profileVm.togglePushNotifications(val),
                  ),
                ),
                _buildDivider(),
                SettingsItemTile(
                  leading: Text('📡', style: TextStyle(fontSize: 16.sp)),
                  title: 'Auto-Sync Interval',
                  trailing: Text(
                    'Every 5 min',
                    style: TextStyle(color: AppColors.orangeStart, fontSize: 13.sp, fontWeight: FontWeight.w600),
                  ),
                ),
                _buildDivider(),
                SettingsItemTile(
                  leading: Text('📍', style: TextStyle(fontSize: 16.sp)),
                  title: 'Location Services',
                  trailing: _buildCustomSwitch(
                    profileVm.locationServices,
                    (val) => profileVm.toggleLocationServices(val),
                  ),
                ),
                _buildDivider(),
                SettingsItemTile(
                  leading: Text('🔒', style: TextStyle(fontSize: 16.sp)),
                  title: 'Require PIN on Open',
                  trailing: _buildCustomSwitch(
                    profileVm.requirePin,
                    (val) => profileVm.toggleRequirePin(val),
                  ),
                ),
                _buildDivider(),
                SettingsItemTile(
                  leading: Text('📸', style: TextStyle(fontSize: 16.sp)),
                  title: 'Auto-Compress Photos',
                  trailing: _buildCustomSwitch(
                    profileVm.autoCompress,
                    (val) => profileVm.toggleAutoCompress(val),
                  ),
                ),
                _buildDivider(),
                SettingsItemTile(
                  leading: Text('📄', style: TextStyle(fontSize: 16.sp)),
                  title: 'Default Report Format',
                  trailing: Text(
                    'PDF',
                    style: TextStyle(color: AppColors.orangeStart, fontSize: 13.sp, fontWeight: FontWeight.w700),
                  ),
                ),
                _buildDivider(),
                SettingsItemTile(
                  leading: Text('🔑', style: TextStyle(fontSize: 16.sp)),
                  title: 'Change Password',
                  trailing: Icon(Icons.arrow_forward_ios_rounded, size: 14.sp, color: const Color(0xFF71717A)),
                  onTap: () {},
                ),
                _buildDivider(),
                SettingsItemTile(
                  leading: Text('📞', style: TextStyle(fontSize: 16.sp)),
                  title: 'Support & Help',
                  trailing: Icon(Icons.arrow_forward_ios_rounded, size: 14.sp, color: const Color(0xFF71717A)),
                  onTap: () {},
                ),
                _buildDivider(),
                SettingsItemTile(
                  leading: Text('ℹ️', style: TextStyle(fontSize: 16.sp)),
                  title: 'App Version',
                  trailing: Text(
                    'v2.4.1',
                    style: TextStyle(color: const Color(0xFF71717A), fontSize: 13.sp),
                  ),
                ),
              ]),
            ],

            SizedBox(height: 24.h),

            // Sign Out Button[cite: 16, 18]
            GestureDetector(
              onTap: () {},
              child: Container(
                width: double.infinity,
                height: 48.h,
                decoration: BoxDecoration(
                  color: const Color(0xFF1F1212),
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: const Color(0xFF7F1D1D).withOpacity(0.4), width: 1),
                ),
                child: Center(
                  child: Text(
                    'Sign Out',
                    style: TextStyle(
                      color: const Color(0xFFEF4444),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }

  // --- Helper Layout Builders ---
  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: EdgeInsets.only(left: 4.w, bottom: 8.h),
      child: Text(
        title,
        style: TextStyle(
          color: const Color(0xFF71717A),
          fontSize: 11.sp,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.8,
        ),
      ),
    );
  }

  Widget _buildCardContainer(List<Widget> children) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF131418),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.white.withOpacity(0.06), width: 1),
      ),
      child: Column(children: children),
    );
  }

  Widget _buildDivider() => Divider(height: 1, thickness: 1, color: Colors.white.withOpacity(0.04));

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18.sp, color: const Color(0xFF71717A)),
          SizedBox(width: 14.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: TextStyle(color: const Color(0xFF71717A), fontSize: 11.sp)),
                SizedBox(height: 3.h),
                Text(value, style: TextStyle(color: AppColors.textPrimary, fontSize: 13.sp, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBadgeRow(String title, String expiry, String badgeText, Color badgeColor) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(color: AppColors.textPrimary, fontSize: 13.sp, fontWeight: FontWeight.w600)),
              SizedBox(height: 2.h),
              Text(expiry, style: TextStyle(color: const Color(0xFF71717A), fontSize: 11.sp)),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
            decoration: BoxDecoration(
              color: badgeColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Text(
              badgeText,
              style: TextStyle(color: badgeColor, fontSize: 10.sp, fontWeight: FontWeight.w700, letterSpacing: 0.5),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String emoji, String val, String title) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: const Color(0xFF131418),
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: Colors.white.withOpacity(0.06), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(emoji, style: TextStyle(fontSize: 16.sp)),
          SizedBox(height: 4.h),
          Text(val, style: TextStyle(color: AppColors.orangeStart, fontSize: 20.sp, fontWeight: FontWeight.w800)),
          Text(title, style: TextStyle(color: const Color(0xFF71717A), fontSize: 11.sp)),
        ],
      ),
    );
  }

  Widget _buildDayBar(String day, double ratio, String count) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        children: [
          SizedBox(width: 32.w, child: Text(day, style: TextStyle(color: const Color(0xFF71717A), fontSize: 11.sp))),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.r),
              child: LinearProgressIndicator(
                value: ratio,
                minHeight: 8.h,
                backgroundColor: const Color(0xFF27272A),
                valueColor: const AlwaysStoppedAnimation(AppColors.orangeStart),
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Text(count, style: TextStyle(color: const Color(0xFF71717A), fontSize: 11.sp)),
        ],
      ),
    );
  }

  Widget _buildRatingBar(String stars, double ratio, String count, Color color) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3.h),
      child: Row(
        children: [
          SizedBox(width: 50.w, child: Text(stars, style: TextStyle(color: const Color(0xFFFACC15), fontSize: 9.sp))),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.r),
              child: LinearProgressIndicator(
                value: ratio,
                minHeight: 6.h,
                backgroundColor: const Color(0xFF27272A),
                valueColor: AlwaysStoppedAnimation(color),
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Text(count, style: TextStyle(color: const Color(0xFF71717A), fontSize: 10.sp)),
        ],
      ),
    );
  }

  Widget _buildCustomSwitch(bool value, ValueChanged<bool> onChanged) {
    return Transform.scale(
      scale: 0.8,
      child: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: Colors.white,
        activeTrackColor: AppColors.orangeStart,
        inactiveThumbColor: Colors.white,
        inactiveTrackColor: const Color(0xFF3F3F46),
      ),
    );
  }
}