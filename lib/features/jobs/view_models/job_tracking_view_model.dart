import 'package:flutter/material.dart';

class JobTrackingViewModel extends ChangeNotifier {
  final List<bool> _completedSteps = List.generate(6, (index) => false);

  List<bool> get completedSteps => _completedSteps;

  void changeStepStatus({required int index, required bool value}) {
    _completedSteps[index] = value;
    notifyListeners();
  }

  int get completedStepsCount {
    return _completedSteps.where((element) => element == true).length;
  }
}
