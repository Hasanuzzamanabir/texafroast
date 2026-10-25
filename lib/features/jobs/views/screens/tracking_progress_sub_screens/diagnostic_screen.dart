import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:texafrost/core/constants/app_colors.dart';
import 'package:texafrost/core/theme/app_decoration.dart';
import 'package:texafrost/core/widgets/custom_app_bar_back.dart';
import 'package:texafrost/core/widgets/custom_button.dart';
import 'package:texafrost/features/jobs/view_models/job_tracking_view_model.dart';
import 'package:texafrost/features/jobs/views/widgets/custom_stepper_widget.dart';
import 'package:texafrost/features/jobs/views/widgets/diagnosis_card_widget.dart';

class DiagnosticTabItem {
  final String title;
  final String emoji;

  const DiagnosticTabItem({required this.title, required this.emoji});
}

class DiagnosticScreen extends StatefulWidget {
  const DiagnosticScreen({super.key});

  @override
  State<DiagnosticScreen> createState() => _DiagnosticScreenState();
}

class _DiagnosticScreenState extends State<DiagnosticScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  final List<DiagnosticTabItem> _tabs = const [
    DiagnosticTabItem(title: 'Readings', emoji: '📊'),
    DiagnosticTabItem(title: 'Electrical', emoji: '⚡'),
    DiagnosticTabItem(title: 'Airflow', emoji: '💨'),
    DiagnosticTabItem(title: 'Refrigerant', emoji: '🌡️'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarBack(title: 'Diagnostics'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 17.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomStepper(currentStep: 2),
              SizedBox(height: 16.h),
              _buildTabBar(),
              SizedBox(height: 24.h),
              // Tab Content Placeholder
              _buildTabContent(),
              SizedBox(height: 32.h),
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    'FINDINGS (2)',
                    style: TextStyle(
                      color: AppColors.labelText,
                      fontWeight: .w700,
                      fontSize: 11.sp,
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.orangeStart.withValues(
                        alpha: .1,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: .circular(10.r),
                      ),
                      side: BorderSide(color: AppColors.orangeStart),
                    ),
                    onPressed: () {},
                    child: Text(
                      '+ ADD',
                      style: TextStyle(
                        color: AppColors.orangeStart,
                        fontWeight: .w600,
                        fontSize: 13.sp,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.5.h),
              diagnosisCardWidget(),
              SizedBox(height: 16.5.h),
              diagnosisCardWidget(),
              SizedBox(height: 22.h),
              CustomButtonWidget(
                title: 'Save & Continue',
                onTap: () {
                  context.read<JobTrackingViewModel>().changeStepStatus(
                    index: 1,
                    value: true,
                  );
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: 50.h),
            ],
          ),
        ),
      ),
    );
  }

  ///////////////////////////////////////
  ///////////// WIDGETS START ///////////////
  //////////////////////////////////////
  Widget _buildTabBar() {
    return Row(
      children: List.generate(_tabs.length, (index) {
        final isSelected = _tabController.index == index;
        final tab = _tabs[index];

        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              right: index == _tabs.length - 1 ? 0 : 8.w,
            ),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _tabController.animateTo(index);
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: EdgeInsets.symmetric(vertical: 14.h),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.orangeStart.withValues(alpha: .3)
                      : AppColors.inputBackground,
                  borderRadius: BorderRadius.circular(14.r),
                  border: Border.all(
                    color: isSelected
                        ? AppColors.orangeStart
                        : Colors.transparent,
                    width: 1.5,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(tab.emoji, style: TextStyle(fontSize: 18.sp)),
                    SizedBox(height: 6.h),
                    Text(
                      tab.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: isSelected
                            ? FontWeight.w700
                            : FontWeight.w600,
                        color: isSelected
                            ? AppColors.orangeStart
                            : const Color(0xFF9CA3AF),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildTabContent() {
    switch (_tabController.index) {
      case 0:
        return _buildSectionContainer(title: 'Readings Content');
      case 1:
        return _buildSectionContainer(title: 'Electrical Content');
      case 2:
        return _buildSectionContainer(title: 'Airflow Content');
      case 3:
        return _buildSectionContainer(title: 'Refrigerant Content');
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildSectionContainer({required String title}) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: GridView.custom(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 80.r,
                    mainAxisSpacing: 12.r,
                    crossAxisSpacing: 12.r,
                  ),
                  childrenDelegate: SliverChildBuilderDelegate((
                    context,
                    index,
                  ) {
                    return Container(
                      padding: .all(12.r),
                      decoration: AppDecorations.container,
                      child: Column(
                        crossAxisAlignment: .start,
                        children: [
                          Text(
                            'Suction Pressure',
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: .w400,
                              color: AppColors.labelText,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          RichText(
                            text: TextSpan(
                              style: TextStyle(
                                fontSize: 22.sp,
                                fontWeight: .w800,
                                color: AppColors.orangeStart,
                              ),
                              text: '68 ',
                              children: [
                                TextSpan(
                                  text: 'PSI',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: .w400,
                                    color: AppColors.labelText,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }, childCount: 6),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
