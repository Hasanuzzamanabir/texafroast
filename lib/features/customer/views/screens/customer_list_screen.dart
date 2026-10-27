import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../routes/app_routes.dart';

class CustomerListScreen extends StatefulWidget {
  const CustomerListScreen({super.key});

  @override
  State<CustomerListScreen> createState() => _CustomerListScreenState();
}

class _CustomerListScreenState extends State<CustomerListScreen> {
  final TextEditingController _searchController = TextEditingController();
  int _selectedFilter = 0;

  final List<String> _filters = const [
    'All Customers',
    'Active Jobs',
    'Commercial',
    'Residential',
  ];

  final List<Map<String, dynamic>> _customers = const [
    {
      'name': 'Riverside Office Complex',
      'contact': 'Marcus Vance (Property Mgr)',
      'phone': '(713) 555-0192',
      'email': 'mvance@riversidecenter.com',
      'address': '2847 Commerce Blvd, Suite 400, Houston, TX',
      'activeJobs': 1,
      'type': 'Commercial',
      'units': 8,
    },
    {
      'name': 'Sunview Medical Center',
      'contact': 'Dr. Sarah Lin (Clinic Director)',
      'phone': '(713) 555-0841',
      'email': 'slin@sunviewhealth.org',
      'address': '1040 Medical Pkwy, Houston, TX',
      'activeJobs': 1,
      'type': 'Commercial',
      'units': 14,
    },
    {
      'name': 'Greenfield Apartments',
      'contact': 'Elena Rostova (Site Supervisor)',
      'phone': '(832) 555-3210',
      'email': 'elena@greenfieldapts.com',
      'address': '5512 Garden View Dr, Houston, TX',
      'activeJobs': 1,
      'type': 'Commercial',
      'units': 24,
    },
    {
      'name': 'Apex Cold Storage & Logistics',
      'contact': 'David Chen (Facility Eng)',
      'phone': '(713) 555-9014',
      'email': 'dchen@apexlogistics.com',
      'address': '9200 Industrial Way, Houston, TX',
      'activeJobs': 0,
      'type': 'Commercial',
      'units': 32,
    },
    {
      'name': 'Robert & Claire Miller',
      'contact': 'Robert Miller (Homeowner)',
      'phone': '(832) 555-4921',
      'email': 'rmiller@gmail.com',
      'address': '1410 Whispering Pines, Spring, TX',
      'activeJobs': 0,
      'type': 'Residential',
      'units': 2,
    },
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
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
                    'Customers',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 6.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.orangeLight,
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(color: AppColors.orangeBorder),
                    ),
                    child: Text(
                      '${_customers.length} Accounts',
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
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search customer, address, or phone...',
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

            // Filter Chips
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
                      padding: EdgeInsets.symmetric(
                        horizontal: 14.w,
                        vertical: 7.h,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.orangeStart
                            : AppColors.surface,
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
                          color: isSelected
                              ? Colors.white
                              : AppColors.textSecondary,
                          fontSize: 12.sp,
                          fontWeight: isSelected
                              ? FontWeight.w700
                              : FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(height: 12.h),

            // Customer List
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
                itemCount: _customers.length,
                separatorBuilder: (_, __) => SizedBox(height: 10.h),
                itemBuilder: (context, index) {
                  final item = _customers[index];
                  final bool hasActiveJob = (item['activeJobs'] as int) > 0;

                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.customerInfo);
                    },
                    child: Container(
                      padding: EdgeInsets.all(14.w),
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(14.r),
                        border: Border.all(color: AppColors.lightGrayBorder),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.02),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 20.r,
                                backgroundColor: AppColors.orangeStart,
                                child: Text(
                                  (item['name'] as String).substring(0, 1),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              SizedBox(width: 12.w),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item['name'],
                                      style: TextStyle(
                                        color: AppColors.textPrimary,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    SizedBox(height: 2.h),
                                    Text(
                                      item['contact'],
                                      style: TextStyle(
                                        color: AppColors.textSecondary,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (hasActiveJob)
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8.w,
                                    vertical: 3.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.orangeLight,
                                    borderRadius: BorderRadius.circular(6.r),
                                  ),
                                  child: Text(
                                    'Active Job',
                                    style: TextStyle(
                                      color: AppColors.orangeEnd,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                size: 14.sp,
                                color: AppColors.textSecondary,
                              ),
                              SizedBox(width: 4.w),
                              Expanded(
                                child: Text(
                                  item['address'],
                                  style: TextStyle(
                                    color: AppColors.textSecondary,
                                    fontSize: 11.5.sp,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          Divider(color: AppColors.lightGrayBorder, height: 1),
                          SizedBox(height: 8.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  '${item['activeJobs']} Active Jobs',
                                  style: TextStyle(
                                    color: AppColors.textSecondary,
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.phone_outlined),
                                    color: AppColors.orangeStart,
                                    iconSize: 18.sp,
                                    padding: EdgeInsets.zero,
                                  ),

                                  SizedBox(width: 14.w),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: AppColors.textMuted,
                                    size: 13.sp,
                                  ),
                                ],
                              ),
                            ],
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
}
