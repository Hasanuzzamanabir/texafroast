import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  int _selectedFilter = 0;
  final List<String> _filters = const ['All', 'Dispatch', 'Customers', 'Team'];

  final List<Map<String, dynamic>> _messages = const [
    {
      'name': 'Central Dispatch',
      'role': 'Dispatcher · Sarah M.',
      'lastMessage':
          'Urgent: Added diagnostic notes to Sunview Medical job #048.',
      'time': '10:45 AM',
      'unread': 2,
      'isDispatch': true,
    },
    {
      'name': 'Marcus Vance',
      'role': 'Riverside Office Complex',
      'lastMessage':
          'Front desk is aware, please use the service elevator at dock B.',
      'time': '9:12 AM',
      'unread': 1,
      'isDispatch': false,
    },
    {
      'name': 'Parts Department',
      'role': 'Inventory & Supply',
      'lastMessage': 'Carrier RTU OEM Capacitor #384 has arrived in warehouse.',
      'time': 'Yesterday',
      'unread': 0,
      'isDispatch': false,
    },
    {
      'name': 'Elena Rostova',
      'role': 'Greenfield Apartments',
      'lastMessage': 'Confirmed 2:00 PM arrival for Building 4 AC tune-up.',
      'time': 'Yesterday',
      'unread': 0,
      'isDispatch': false,
    },
    {
      'name': 'Dave Miller',
      'role': 'Lead Technician',
      'lastMessage':
          'Can you transfer the spare recovery tank after your shift?',
      'time': 'Oct 24',
      'unread': 0,
      'isDispatch': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.orangeStart,
        child: const Icon(Icons.edit_note_rounded, color: Colors.white),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Messages',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 5.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.orangeLight,
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(color: AppColors.orangeBorder),
                    ),
                    child: Text(
                      '3 Unread',
                      style: TextStyle(
                        color: AppColors.orangeEnd,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Search Bar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: AppColors.lightGrayBorder),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search chats, contacts, dispatches...',
                    hintStyle: TextStyle(
                      color: AppColors.inputHint,
                      fontSize: 13.sp,
                    ),
                    prefixIcon: Icon(
                      Icons.search_rounded,
                      color: AppColors.textSecondary,
                      size: 20.sp,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 12.h),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h),

            // Filter Tabs
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: List.generate(_filters.length, (index) {
                  final isSelected = _selectedFilter == index;
                  return GestureDetector(
                    onTap: () => setState(() => _selectedFilter = index),
                    child: Container(
                      margin: EdgeInsets.only(right: 8.w),
                      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 7.h),
                      decoration: BoxDecoration(
                        color: isSelected ? AppColors.orangeStart : AppColors.surface,
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(
                          color: isSelected
                              ? AppColors.orangeStart
                              : AppColors.lightGrayBorder,
                        ),
                      ),
                      child: Text(
                        _filters[index],
                        style: TextStyle(
                          color: isSelected ? Colors.white : AppColors.textSecondary,
                          fontSize: 12.sp,
                          fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(height: 8.h),

            // Messages List
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
                itemCount: _messages.length,
                separatorBuilder: (_, _) =>
                    Divider(color: AppColors.lightGrayBorder, height: 1),
                itemBuilder: (context, index) {
                  final chat = _messages[index];
                  final bool hasUnread = (chat['unread'] as int) > 0;
                  final bool isDispatch = chat['isDispatch'] as bool;

                  return InkWell(
                    onTap: () {
                      _showChatDetail(
                        context,
                        chat['name'],
                        chat['lastMessage'],
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              CircleAvatar(
                                radius: 22.r,
                                backgroundColor: isDispatch
                                    ? AppColors.blueStart
                                    : AppColors.orangeStart,
                                child: Icon(
                                  isDispatch
                                      ? Icons.headset_mic_rounded
                                      : Icons.person_rounded,
                                  color: Colors.white,
                                  size: 20.sp,
                                ),
                              ),
                              if (hasUnread)
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: Container(
                                    width: 10.r,
                                    height: 10.r,
                                    decoration: BoxDecoration(
                                      color: AppColors.redStart,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: AppColors.surface,
                                        width: 1.5,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        chat['name'],
                                        style: TextStyle(
                                          color: AppColors.textPrimary,
                                          fontSize: 14.5.sp,
                                          fontWeight: hasUnread
                                              ? FontWeight.w800
                                              : FontWeight.w600,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    SizedBox(width: 8.w),
                                    Text(
                                      chat['time'],
                                      style: TextStyle(
                                        color: hasUnread
                                            ? AppColors.orangeEnd
                                            : AppColors.textSecondary,
                                        fontSize: 11.sp,
                                        fontWeight: hasUnread
                                            ? FontWeight.w700
                                            : FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 2.h),
                                Text(
                                  chat['role'],
                                  style: TextStyle(
                                    color: AppColors.textMuted,
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  chat['lastMessage'],
                                  style: TextStyle(
                                    color: hasUnread
                                        ? AppColors.textPrimary
                                        : AppColors.textSecondary,
                                    fontSize: 12.sp,
                                    fontWeight: hasUnread
                                        ? FontWeight.w600
                                        : FontWeight.w400,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showChatDetail(
    BuildContext context,
    String sender,
    String lastMessage,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => Container(
        height: 0.75.sh,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        ),
        child: Column(
          children: [
            Container(
              width: 36.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: AppColors.lightGrayBorder,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                CircleAvatar(
                  radius: 18.r,
                  backgroundColor: AppColors.orangeStart,
                  child: Text(
                    sender.substring(0, 1),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Text(
                    sender,
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close_rounded),
                ),
              ],
            ),
            const Divider(),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.all(12.w),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceLight,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Text(
                        lastMessage,
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 13.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              decoration: BoxDecoration(
                color: AppColors.surfaceLight,
                borderRadius: BorderRadius.circular(24.r),
                border: Border.all(color: AppColors.lightGrayBorder),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Type message...',
                        hintStyle: TextStyle(
                          color: AppColors.inputHint,
                          fontSize: 13.sp,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.send_rounded),
                    color: AppColors.orangeStart,
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.h),
          ],
        ),
      ),
    );
  }
}
