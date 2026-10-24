import 'package:flutter/material.dart';
import 'package:texafrost/features/auth/views/screens/forget_password_screen.dart';
import 'package:texafrost/features/auth/views/screens/login_screen.dart';
import 'package:texafrost/features/customer/views/screens/customer_info_screen.dart';
import 'package:texafrost/features/dashboard/views/screens/home_screen.dart';
import 'package:texafrost/features/customer/views/screens/equipment_screen.dart';
import 'package:texafrost/features/customer/views/screens/job_detail_screen.dart';
import 'package:texafrost/features/customer/views/screens/service_history_screen.dart';
import 'package:texafrost/features/onboarding/views/screens/onboarding_screen.dart';
import 'package:texafrost/features/splash/splash_screen.dart';
import 'package:texafrost/features/sync_queue/views/screens/sync_details_screen.dart';

// Screens
// import '../features/auth/views/screens/pin_screen.dart';
// import '../features/dashboard/views/screens/home_screen.dart';
// import '../features/schedule/views/screens/schedule_screen.dart';
// import '../features/customer/views/screens/customer_info_screen.dart';
// import '../features/jobs/views/screens/job_detail_screen.dart';
// import '../features/jobs/views/screens/tracking_progress_screen.dart';
// import '../features/sync_queue/views/screens/offline_queue_screen.dart';
// import '../features/profile/views/screens/profile_screen.dart';

class AppRoutes {
  AppRoutes._();

  // Route Names
  static const String initial = '/';
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String forgotPassword = '/forgot-password';
  static const String home = '/home';
  static const String syncDetails = '/sync-details';
  static const String jobDetails = '/job-details';
static const String customerInfo = '/customer-info';
static const String equipment = '/equipment';
static const String serviceHistory = '/service-history';

  // static const String pinAuth = '/pin-auth';
   static const String dashboard = '/dashboard';
  // static const String schedule = '/schedule';
  // static const String customerInfo = '/customer-info';
  // static const String jobDetails = '/job-details';
  // static const String trackingProgress = '/tracking-progress';
  // static const String offlineQueue = '/offline-queue';
  // static const String profile = '/profile';

  // Route Generator
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initial:
  
      case splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
        case onboarding:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );

      case login:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
        case forgotPassword:
        return MaterialPageRoute(
          builder: (_) => const ForgotPasswordScreen(),
        );
    case dashboard:
      case home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
        case syncDetails:
  return MaterialPageRoute(
    builder: (_) => const SyncDetailsScreen(),
  );
  case jobDetails:
  return MaterialPageRoute(builder: (_) => const JobDetailScreen());
case customerInfo:
  return MaterialPageRoute(builder: (_) => const CustomerInfoScreen());
case equipment:
  return MaterialPageRoute(builder: (_) => const EquipmentScreen());
case serviceHistory:
  return MaterialPageRoute(builder: (_) => const ServiceHistoryScreen());

      // case pinAuth:
      //   return MaterialPageRoute(
      //     builder: (_) => const PinScreen(),
      //   );

      case home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );

      // case schedule:
      //   return MaterialPageRoute(
      //     builder: (_) => const ScheduleScreen(),
      //   );

      // case customerInfo:
      //   return MaterialPageRoute(
      //     builder: (_) => const CustomerInfoScreen(),
      //   );

      // case jobDetails:
      //   return MaterialPageRoute(
      //     builder: (_) => const JobDetailScreen(),
      //   );

      // case trackingProgress:
      //   return MaterialPageRoute(
      //     builder: (_) => const TrackingProgressScreen(),
      //   );

      // case offlineQueue:
      //   return MaterialPageRoute(
      //     builder: (_) => const OfflineQueueScreen(),
      //   );

      // case profile:
      //   return MaterialPageRoute(
      //     builder: (_) => const ProfileScreen(),
      //   );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            backgroundColor: const Color(0xFF0A0A0B),
            body: Center(
              child: Text(
                'Route Not Found: ${settings.name}',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        );
    }
  }
}