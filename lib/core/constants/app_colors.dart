import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color background = Color(0xFF0A0A0B);
  static const Color Background = background;
  static const Color surfaceLight = Color(0xFF2A2A2F);
  // Text Colors
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFF9CA3AF);
  static const Color skipButtonBg = Color(0xFF1E2129);

  // Figma Gradient Colors
  // Orange
  static const Color orangeStart = Color(0xFFF97316);
  static const Color orangeEnd = Color(0xFFEA580C);

  // Blue
  static const Color blueStart = Color(0xFF3B82F6);
  static const Color blueEnd = Color(0xFF6366F1);
  static const Color blueGlow = Color(0xFF60A5FA);

  // Green
  static const Color greenStart = Color(0xFF22C55E);
  static const Color greenEnd = Color(0xFF16A34A);

  // Text Field Colors (From Figma Inspector)
  static const Color inputBackground = Color(0xFF1C1C1F);
  static const Color inputBorder = Color(0xFF2A2A2F);
  static const Color inputHint = Color(0xFF6B6B7A);
  static const Color labelText = Color(0xFF8E8E93);

  // Button Gradients
  static const LinearGradient orangeGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [orangeStart, orangeEnd],
  );

  static const LinearGradient blueGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [blueStart, blueEnd],
  );

  static const LinearGradient greenGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [greenStart, greenEnd],
  );

  static const LinearGradient cardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF222430), Color(0xFF1B1C24)],
  );
}
