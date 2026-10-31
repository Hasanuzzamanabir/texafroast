import 'package:flutter/material.dart';

class PinViewModel extends ChangeNotifier {
  String _pin = '';
  bool _isLoading = false;
  String? _errorMessage;

  String get pin => _pin;
  int get pinLength => _pin.length;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get isComplete => _pin.length == 4;

  void addDigit(String digit) {
    if (_pin.length < 4 && !_isLoading) {
      _pin += digit;
      _errorMessage = null;
      notifyListeners();
    }
  }

  void deleteDigit() {
    if (_pin.isNotEmpty && !_isLoading) {
      _pin = _pin.substring(0, _pin.length - 1);
      _errorMessage = null;
      notifyListeners();
    }
  }

  void clear() {
    _pin = '';
    _errorMessage = null;
    notifyListeners();
  }

  Future<bool> verifyPin() async {
    if (_pin.length != 4) return false;

    _isLoading = true;
    notifyListeners();

    // Simulated PIN verification delay
    await Future.delayed(const Duration(milliseconds: 600));

    _isLoading = false;
    notifyListeners();
    return true;
  }
}

