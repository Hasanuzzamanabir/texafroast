import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool _rememberMe = true;
  bool _obscurePassword = true;

  bool get isLoading => _isLoading;
  bool get rememberMe => _rememberMe;
  bool get obscurePassword => _obscurePassword;

  void togglePasswordVisibility() {
    _obscurePassword = !_obscurePassword;
    notifyListeners();
  }

  void toggleRememberMe() {
    _rememberMe = !_rememberMe;
    notifyListeners();
  }

  Future<bool> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    // Dio / Hive authentication logic ekhane ashbe
    await Future.delayed(const Duration(milliseconds: 1200));

    _isLoading = false;
    notifyListeners();
    return true;
  }

  Future<bool> sendResetLink(String email) async {
    _isLoading = true;
    notifyListeners();

    // Reset password API call
    await Future.delayed(const Duration(milliseconds: 1000));

    _isLoading = false;
    notifyListeners();
    return true;
  }
}