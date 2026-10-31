import 'package:flutter/material.dart';
import 'package:texafrost/features/auth/views/screens/forget_password_screen.dart';
import 'package:texafrost/features/auth/views/screens/login_screen.dart';
import 'package:texafrost/features/auth/views/screens/pin_screen.dart';
import 'package:texafrost/features/customer/views/screens/customer_info_screen.dart';
import 'package:texafrost/features/dashboard/views/screens/home_screen.dart';
import 'package:texafrost/features/customer/views/screens/equipment_screen.dart';
import 'package:texafrost/features/customer/views/screens/service_history_screen.dart';
import 'package:texafrost/features/jobs/views/screens/arrived_job_screen.dart';
import 'package:texafrost/features/jobs/views/screens/tracking_progress_screen.dart';
import 'package:texafrost/features/jobs/views/screens/tracking_progress_sub_screens/checklist_screen.dart';
import 'package:texafrost/features/jobs/views/screens/tracking_progress_sub_screens/customer_signature_screen.dart';
import 'package:texafrost/features/jobs/views/screens/tracking_progress_sub_screens/diagnostic_screen.dart';
import 'package:texafrost/features/jobs/views/screens/tracking_progress_sub_screens/job_complete_page_screen.dart';
import 'package:texafrost/features/jobs/views/screens/tracking_progress_sub_screens/job_report_screen.dart';
import 'package:texafrost/features/jobs/views/screens/tracking_progress_sub_screens/notes_screen.dart';
import 'package:texafrost/features/jobs/views/screens/tracking_progress_sub_screens/part_material_screen.dart';
import 'package:texafrost/features/jobs/views/screens/tracking_progress_sub_screens/photo_video_screen.dart';
import 'package:texafrost/features/jobs/views/screens/view_job_screen.dart';
import 'package:texafrost/features/onboarding/views/screens/onboarding_screen.dart';
import 'package:texafrost/features/splash/splash_screen.dart';
import 'package:texafrost/features/sync_queue/views/screens/sync_details_screen.dart';
import 'package:texafrost/features/customer/views/screens/customer_list_screen.dart';
import 'package:texafrost/features/messages/views/screens/messages_screen.dart';
import 'package:texafrost/features/profile/views/screens/profile_screen.dart';

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
  // static const String offlineQueue = '/offline-queue';
  // static const String profile = '/profile';
  static const String viewJob = '/view-job';
  static const String arrivedJob = '/arrived-job';
  static const String trackingProgress = '/tracking-progress';
  static const String checklist = '/checklist';
  static const String diagnostic = '/diagnostic';
  static const String notes = '/notes';
  static const String partsAndMaterials = '/parts-and-materials';
  static const String photoAndVideo = '/photo-and-video';
  static const String customerSignature = '/customer-signature';
  static const String customers = '/customers';
  static const String messages = '/messages';
  static const String profile = '/profile';
  static const String jobReport = '/job-report';
  static const String jobComplete = '/job-complete';
  static const String pin = '/pin';

  // Route Generator
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initial:
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());

      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case forgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case dashboard:
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case syncDetails:
        return MaterialPageRoute(builder: (_) => const SyncDetailsScreen());
      case customerInfo:
        return MaterialPageRoute(builder: (_) => const CustomerInfoScreen());
      case equipment:
        return MaterialPageRoute(builder: (_) => const EquipmentScreen());
      case serviceHistory:
        return MaterialPageRoute(builder: (_) => const ServiceHistoryScreen());
      case jobDetails:
      case viewJob:
        final jobId = settings.arguments as String?;
        return MaterialPageRoute(builder: (_) => ViewJobScreen(jobID: jobId));
      case arrivedJob:
        return MaterialPageRoute(builder: (_) => const ArrivedJobScreen());
      case trackingProgress:
        return MaterialPageRoute(
          builder: (_) => const TrackingProgressScreen(),
        );
      case checklist:
        return MaterialPageRoute(builder: (_) => ChecklistScreen());
      case diagnostic:
        return MaterialPageRoute(builder: (_) => const DiagnosticScreen());
      case notes:
        return MaterialPageRoute(builder: (_) => const NotesScreen());
      case partsAndMaterials:
        return MaterialPageRoute(builder: (_) => const PartMaterialScreen());
      case photoAndVideo:
        return MaterialPageRoute(builder: (_) => const PhotoVideoScreen());
      case customerSignature:
        return MaterialPageRoute(
          builder: (_) => const CustomerSignatureScreen(),
        );
      case customers:
        return MaterialPageRoute(builder: (_) => const CustomerListScreen());
      case messages:
        return MaterialPageRoute(builder: (_) => const MessagesScreen());
      case profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case jobReport:
        return MaterialPageRoute(builder: (_) => const JobReportScreen());
      case jobComplete:
        return MaterialPageRoute(builder: (_) => const JobCompletePageScreen());
      case pin:
        return MaterialPageRoute(builder: (_) => const PinScreen());
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
