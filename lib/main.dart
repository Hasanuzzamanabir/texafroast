import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:texafrost/features/auth/view_models/auth_view_model.dart';
import 'package:texafrost/features/dashboard/view_models/dashboard_summary_view_model.dart';
import 'package:texafrost/features/profile/view_models/profile_view_model.dart';
import 'package:texafrost/features/schedule/view_models/schedule_view_model.dart';
import 'package:texafrost/features/sync_queue/view_models/sync_queue_view_model.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => DashboardProvider()),
        ChangeNotifierProvider(create: (_) => ScheduleProvider()),
        ChangeNotifierProvider(create: (_) => SyncQueueViewModel()),
        ChangeNotifierProvider(create: (_) => ProfileViewModel()),
      ],
      child: const Texafrost(),
    ),
  );
}
