import 'package:flutter/material.dart';
import 'package:texafrost/features/schedule/models/schedule_slot_model.dart';

class ScheduleProvider extends ChangeNotifier {
  int _selectedDateIndex = 1; // Tue Sep 2
  int _selectedFilterIndex = 0;

  final List<String> _filters = const [
    'All Schedules',
    'In Progress',
    'Assigned',
    'Completed',
  ];

  final List<ScheduleSlotModel> _slots = const [
    ScheduleSlotModel(time: '7:00 AM'),
    ScheduleSlotModel(
      time: '8:00 AM',
      jobId: 'JOB-20240901-047',
      title: 'Riverside Office Complex',
      address: '2847 Commerce Blvd, Suite 400',
      arrivalWindow: '8:00 AM – 10:00 AM',
      assignedTechnician: 'Tom Harrison (You)',
      status: 'IN PROGRESS',
      serviceTag: 'Preventive Maintenance',
      duration: '3 hrs',
    ),
    ScheduleSlotModel(time: '9:00 AM'),
    ScheduleSlotModel(time: '10:00 AM'),
    ScheduleSlotModel(
      time: '11:30 AM',
      jobId: 'JOB-20240901-048',
      title: 'Sunview Medical Center',
      address: '1040 Medical Pkwy, Houston, TX',
      arrivalWindow: '11:30 AM – 1:30 PM',
      assignedTechnician: 'Tom Harrison (You)',
      status: 'ASSIGNED',
      serviceTag: 'Emergency Repair',
      duration: '2 hrs',
    ),
    ScheduleSlotModel(time: '1:00 PM'),
    ScheduleSlotModel(
      time: '2:00 PM',
      jobId: 'JOB-20240901-049',
      title: 'Greenfield Apartments',
      address: '5512 Garden View Dr, Houston, TX',
      arrivalWindow: '2:00 PM – 3:30 PM',
      assignedTechnician: 'Tom Harrison & Alex R.',
      status: 'ASSIGNED',
      serviceTag: 'AC Tune-Up',
      duration: '1.5 hrs',
    ),
    ScheduleSlotModel(time: '3:30 PM'),
    ScheduleSlotModel(
      time: '4:00 PM',
      jobId: 'JOB-20240901-050',
      title: 'Apex Cold Storage & Logistics',
      address: '9200 Industrial Way, Houston, TX',
      arrivalWindow: '4:00 PM – 5:30 PM',
      assignedTechnician: 'Dave Miller',
      status: 'ASSIGNED',
      serviceTag: 'Compressor Diagnostic',
      duration: '1.5 hrs',
    ),
    ScheduleSlotModel(time: '5:00 PM'),
  ];

  int get selectedDateIndex => _selectedDateIndex;
  int get selectedFilterIndex => _selectedFilterIndex;
  List<String> get filters => _filters;

  List<ScheduleSlotModel> get slots => _slots;

  void selectDate(int index) {
    _selectedDateIndex = index;
    notifyListeners();
  }

  void selectFilter(int index) {
    _selectedFilterIndex = index;
    notifyListeners();
  }
}
