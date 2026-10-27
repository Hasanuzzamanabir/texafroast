import 'package:flutter/material.dart';
import '../models/home_model.dart';

class DashboardProvider extends ChangeNotifier {
  int _currentIndex = 0;
  int _unreadJobsCount = 3;
  int _unreadMessagesCount = 2;
  int _selectedFilterIndex = 0;

  // Time tracking
  bool _isClockedIn = true;
  String _clockInTime = '8:15 AM';
  String _hoursWorkedToday = '3h 45m';

  // Sync state
  bool _isSyncing = false;
  int _pendingSyncCount = 0;
  String _lastSyncedTime = 'Just now';

  final List<String> _filters = const [
    'All Jobs',
    'Assigned',
    'In Progress',
    'Completed',
  ];

  final List<HomeModel> _allJobs = const [
    HomeModel(
      id: 'JOB-20240901-047',
      title: 'Riverside Office Complex',
      address: '2847 Commerce Blvd, Suite 400',
      timeRange: '8:00 AM · 3 hrs',
      status: 'IN PROGRESS',
      serviceTag: 'Preventive Maintenance',
      dotColor: PriorityDotColor.orange,
    ),
    HomeModel(
      id: 'JOB-20240901-048',
      title: 'Sunview Medical Center',
      address: '1040 Medical Pkwy',
      timeRange: '11:30 AM · 2 hrs',
      status: 'ASSIGNED',
      serviceTag: 'Emergency Repair',
      dotColor: PriorityDotColor.red,
    ),
    HomeModel(
      id: 'JOB-20240901-049',
      title: 'Greenfield Apartments',
      address: '5512 Garden View Dr',
      timeRange: '2:00 PM · 1.5 hrs',
      status: 'ASSIGNED',
      serviceTag: 'AC Tune-Up',
      dotColor: PriorityDotColor.green,
    ),
  ];

  // Getters
  int get currentIndex => _currentIndex;
  int get unreadJobsCount => _unreadJobsCount;
  int get unreadMessagesCount => _unreadMessagesCount;
  int get selectedFilterIndex => _selectedFilterIndex;
  List<String> get filters => _filters;
  List<HomeModel> get jobs => _allJobs;
  int get assignedTodayCount => _allJobs.length;

  bool get isClockedIn => _isClockedIn;
  String get clockInTime => _clockInTime;
  String get hoursWorkedToday => _hoursWorkedToday;

  bool get isSyncing => _isSyncing;
  int get pendingSyncCount => _pendingSyncCount;
  String get lastSyncedTime => _lastSyncedTime;

  HomeModel? get activeJob => _allJobs.isNotEmpty ? _allJobs.first : null;

  // Methods
  void changeTab(int index) {
    if (_currentIndex != index) {
      _currentIndex = index;
      notifyListeners();
    }
  }

  void updateJobsCount(int count) {
    _unreadJobsCount = count;
    notifyListeners();
  }

  void selectFilter(int index) {
    _selectedFilterIndex = index;
    notifyListeners();
  }

  void toggleClockIn() {
    _isClockedIn = !_isClockedIn;
    notifyListeners();
  }

  Future<void> retrySync() async {
    _isSyncing = true;
    notifyListeners();
    await Future.delayed(const Duration(milliseconds: 1200));
    _isSyncing = false;
    _pendingSyncCount = 0;
    _lastSyncedTime = 'Just now';
    notifyListeners();
  }
}