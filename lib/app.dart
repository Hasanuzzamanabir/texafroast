import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:texafrost/core/constants/app_colors.dart';
import 'package:texafrost/routes/app_routes.dart';

class Texafrost extends StatelessWidget {
  const Texafrost({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(370, 824),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Texafrost',
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.initial, 
          onGenerateRoute: AppRoutes.onGenerateRoute,
          theme: ThemeData(
          scaffoldBackgroundColor: AppColors.background,
            primaryColor: AppColors.orangeStart,
          ),
        );
      },
    );
  }
}