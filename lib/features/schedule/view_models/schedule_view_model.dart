import 'package:flutter/material.dart';
import 'package:texafrost/features/schedule/models/schedule_slot_model.dart';

class ScheduleProvider extends ChangeNotifier {
  final List<ScheduleSlotModel> _slots = const [
    ScheduleSlotModel(time: '7am'),
    ScheduleSlotModel(
      time: '8am',
      title: 'Riverside Office Complex',
      serviceTag: 'Preventive Maintenance',
      duration: '3 hrs',
    ),
    ScheduleSlotModel(time: '9am'),
    ScheduleSlotModel(time: '10am'),
    ScheduleSlotModel(
      time: '11am',
      title: 'Sunview Medical Center',
      serviceTag: 'Emergency Repair',
      duration: '2 hrs',
    ),
    ScheduleSlotModel(time: '12pm'),
    ScheduleSlotModel(time: '1pm'),
    ScheduleSlotModel(
      time: '2pm',
      title: 'Greenfield Apartments',
      serviceTag: 'AC Tune-Up',
      duration: '1.5 hrs',
    ),
    ScheduleSlotModel(time: '3pm'),
    ScheduleSlotModel(time: '4pm'),
    ScheduleSlotModel(time: '5pm'),
  ];

  List<ScheduleSlotModel> get slots => _slots;
}