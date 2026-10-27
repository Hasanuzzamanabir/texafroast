import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/icon_path.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../routes/app_routes.dart';

class OnboardData {
  final String title;
  final String description;
  final String iconPath;
  final ButtonType buttonType;
  final String buttonText;
  final Color themeColor;
  final Color bgGlowColor;

  const OnboardData({
    required this.title,
    required this.description,
    required this.iconPath,
    required this.buttonType,
    required this.buttonText,
    required this.themeColor,
    required this.bgGlowColor,
  });
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<OnboardData> _pages = const [
    // 1st Screen: Blue (Clipboard)
    OnboardData(
      title: 'Assigned Jobs, Always\nOrganized',
      description:
          'View all your daily assignments at a glance. Priority levels, schedules, and job types — everything you need before you start.',
      iconPath: IconPath.onboardingIcon1,
      buttonType: ButtonType.blue,
      buttonText: 'Continue',
      themeColor: AppColors.blueGlow, // #60A5FA
      bgGlowColor: Color.fromARGB(255, 107, 149, 190),
    ),
    // 2nd Screen: Orange (Wrench)
    OnboardData(
      title: 'Complete the Full Service\nFlow',
      description:
          'Walk through every step — checklist, diagnostics, notes, photos, parts, and customer signature — without missing a beat.',
      iconPath: IconPath.onboardingIcon2,
      buttonType: ButtonType.orange,
      buttonText: 'Continue',
      themeColor: AppColors.orangeStart, // #F97316
      bgGlowColor: Color.fromARGB(255, 206, 173, 145),
    ),
    // 3rd Screen: Green (Dish Antenna)
    OnboardData(
      title: 'Works Offline, Syncs\nAutomatically',
      description:
          'No signal? No problem. All your work saves locally and syncs the moment your connection returns.',
      iconPath: IconPath.onboardingIcon3,
      buttonType: ButtonType.green,
      buttonText: 'Get Started',
      themeColor: AppColors.greenStart, // #22C55E
      bgGlowColor: Color.fromARGB(255, 183, 255, 193),
    ),
  ];

  void _onNext() {
    if (_currentIndex < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentItem = _pages[_currentIndex];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          // স্ক্রিনের ব্যাকগ্রাউন্ড সফট গ্লো
          gradient: RadialGradient(
            center: const Alignment(0.0, -0.2),
            radius: 1.15,
            colors: [
              currentItem.bgGlowColor.withOpacity(0.85),
              AppColors.background,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                SizedBox(height: 12.h),

                // Top Right Skip Button
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, AppRoutes.login);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.skipButtonBg,
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.06),
                          width: 1,
                        ),
                      ),
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          color: const Color(0xFF9E9EA7),
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),

                // Middle Content PageView
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: _pages.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      final item = _pages[index];
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Center 120x120 Rounded Box (Figma Spec)[cite: 16, 17, 18]
                          Container(
                            width: 120.w,
                            height: 120.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(36.r),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  item.themeColor.withOpacity(
                                    0.133,
                                  ), // 13.3%[cite: 16, 17, 18]
                                  item.themeColor.withOpacity(
                                    0.267,
                                  ), // 26.7%[cite: 16, 17, 18]
                                ],
                              ),
                              border: Border.all(
                                color: item.themeColor.withOpacity(
                                  0.267,
                                ), // 26.7%[cite: 16, 17, 18]
                                width: 1, //[cite: 16, 17, 18]
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: item.themeColor.withOpacity(
                                    0.20,
                                  ), // 20%[cite: 16, 17, 18]
                                  blurRadius: 60, //[cite: 16, 17, 18]
                                  offset: const Offset(0, 0),
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            child: Center(
                              child: Image.asset(
                                item.iconPath,
                                width: 64.w,
                                height: 64.h,
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) {
                                  return Icon(
                                    Icons.broken_image_rounded,
                                    size: 40.sp,
                                    color: item.themeColor,
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 48.h),

                          // Title Text
                          Text(
                            item.title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w700,
                              height: 1.25,
                              letterSpacing: -0.5,
                            ),
                          ),
                          SizedBox(height: 16.h),

                          // Subtitle Text (Figma: Size 15, Line-height 25.5, Color #9CA3AF)[cite: 19]
                          SizedBox(
                            width: 306.w,
                            child: Text(
                              item.description,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.textPrimary,
                                fontSize: 15.sp, //[cite: 19]
                                height: 25.5 / 15, // 1.7[cite: 19]
                                fontWeight: FontWeight.w400, //[cite: 19]
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),

                // Indicators (Figma Spec)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(_pages.length, (index) {
                    final bool isActive = _currentIndex == index;
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      margin: EdgeInsets.symmetric(horizontal: 4.w),
                      width: isActive ? 26.w : 6.w,
                      height: 4.h,
                      decoration: BoxDecoration(
                        color: isActive
                            ? currentItem.themeColor
                            : const Color(0xFF262A34),
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    );
                  }),
                ),
                SizedBox(height: 36.h),

                // Bottom Action Button
                CustomButtonWidget(
                  title: currentItem.buttonText,
                  type: currentItem.buttonType,
                  onTap: _onNext,
                ),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
