import 'package:flutter/material.dart';
import '../models/home_model.dart';

class DashboardProvider extends ChangeNotifier {
  int _currentIndex = 0;
  int _unreadJobsCount = 3;
  int _selectedFilterIndex = 0;

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
      status: 'ASSIGNED',
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
  int get selectedFilterIndex => _selectedFilterIndex;
  List<String> get filters => _filters;
  List<HomeModel> get jobs => _allJobs;
  int get assignedTodayCount => _allJobs.length;

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
}