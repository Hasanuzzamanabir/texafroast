import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:texafrost/core/constants/app_colors.dart';
import 'package:texafrost/features/jobs/view_models/job_tracking_view_model.dart';
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
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => JobTrackingViewModel()),
          ],
          child: MaterialApp(
            title: 'Texafrost',
            debugShowCheckedModeBanner: false,
            initialRoute: AppRoutes.initial,
            onGenerateRoute: AppRoutes.onGenerateRoute,
            theme: ThemeData(
              scaffoldBackgroundColor: AppColors.background,
              primaryColor: AppColors.orangeStart,
              dividerTheme: DividerThemeData(color: AppColors.inputBorder),
            ),
          ),
        );
      },
    );
  }
}
