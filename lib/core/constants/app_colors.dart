import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Background & Surfaces (Default White theme)
  static const Color background = Color(0xFFF8FAFC);
  static const Color Background = background;
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceLight = Color(0xFFF1F5F9);
  static const Color cardBg = Color(0xFFFFFFFF);
  static const Color cardBorder = Color(0xFFE2E8F0);

  // Text Colors (Dark readable text)
  static const Color textPrimary = Color(0xFF0F172A);
  static const Color textSecondary = Color(0xFF64748B);
  static const Color textMuted = Color(0xFF94A3B8);
  static const Color skipButtonBg = Color(0xFFF1F5F9);

  // Protra's Orange (Primary Buttons & Selected Items)
  static const Color orangeStart = Color(0xFFF97316);
  static const Color orangeEnd = Color(0xFFEA580C);
  static const Color orangeLight = Color(0xFFFFF7ED);
  static const Color orangeBorder = Color(0xFFFED7AA);

  // Accent & State Colors
  static const Color blueStart = Color(0xFF2563EB);
  static const Color blueEnd = Color(0xFF1D4ED8);
  static const Color blueGlow = Color(0xFF3B82F6);
  static const Color blueLight = Color(0xFFEFF6FF);

  static const Color greenStart = Color(0xFF16A34A);
  static const Color greenEnd = Color(0xFF15803D);
  static const Color greenLight = Color(0xFFF0FDF4);

  static const Color redStart = Color(0xFFEF4444);
  static const Color redLight = Color(0xFFFEF2F2);

  // Light Gray Borders & Form Inputs
  static const Color lightGrayBorder = Color(0xFFE2E8F0);
  static const Color inputBackground = Color(0xFFFFFFFF);
  static const Color inputBorder = Color(0xFFCBD5E1);
  static const Color inputHint = Color(0xFF94A3B8);
  static const Color labelText = Color(0xFF334155);

  // Gradients
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
    colors: [Color(0xFFFFFFFF), Color(0xFFF8FAFC)],
  );
}
