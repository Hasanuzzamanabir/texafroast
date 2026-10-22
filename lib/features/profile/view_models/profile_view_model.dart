import 'package:flutter/material.dart';
import '../models/profile_model.dart';

class ProfileViewModel extends ChangeNotifier {
  int _selectedTabIndex = 0; // 0: Profile, 1: Stats, 2: Settings

  // Settings Switch States
  bool _pushNotifications = true;
  bool _locationServices = true;
  bool _requirePin = false;
  bool _autoCompress = true;

  final TechnicianProfileModel _profile = const TechnicianProfileModel(
    name: 'David Martinez',
    role: 'Senior HVAC Technician',
    id: '#TEC-0047',
    location: 'Houston, TX',
    onDuty: true,
    experience: '8 YRS EXPERIENCE',
    phone: '(713) 555-0047',
    email: 'd.martinez@protra.com',
    baseLocation: 'Protra Houston Depot — Bay C',
    serviceVehicle: 'Truck #T-14 — 2023 Ford Transit',
    equipmentKit: 'Kit #K-09 — Full HVAC Diagnostic',
  );

  int get selectedTabIndex => _selectedTabIndex;
  TechnicianProfileModel get profile => _profile;

  bool get pushNotifications => _pushNotifications;
  bool get locationServices => _locationServices;
  bool get requirePin => _requirePin;
  bool get autoCompress => _autoCompress;

  void selectTab(int index) {
    _selectedTabIndex = index;
    notifyListeners();
  }

  void togglePushNotifications(bool val) {
    _pushNotifications = val;
    notifyListeners();
  }

  void toggleLocationServices(bool val) {
    _locationServices = val;
    notifyListeners();
  }

  void toggleRequirePin(bool val) {
    _requirePin = val;
    notifyListeners();
  }

  void toggleAutoCompress(bool val) {
    _autoCompress = val;
    notifyListeners();
  }
}