import 'package:flutter/material.dart';

class JobTrackingViewModel extends ChangeNotifier {
  int _eligibleStep = 0;
  int get eligibleStep => _eligibleStep;

  final List<bool> _completedSteps = List.generate(6, (index) => false);

  List<bool> get completedSteps => _completedSteps;

  void changeStepStatus({required int index, required bool value}) {
    _completedSteps[index] = value;
    if (value == true) {
      _eligibleStep = index + 1;
    } else {
      _eligibleStep = index;
    }
    notifyListeners();
  }

  int get completedStepsCount {
    return _completedSteps.where((element) => element == true).length;
  }
}
