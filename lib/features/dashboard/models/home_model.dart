import 'package:flutter/material.dart';

enum PriorityDotColor { orange, red, green }

class HomeModel {
  final String id;
  final String title;
  final String address;
  final String timeRange;
  final String status;
  final String serviceTag;
  final PriorityDotColor dotColor;

  const HomeModel({
    required this.id,
    required this.title,
    required this.address,
    required this.timeRange,
    required this.status,
    required this.serviceTag,
    required this.dotColor,
  });

  Color get dotColorValue {
    switch (dotColor) {
      case PriorityDotColor.orange:
        return const Color(0xFFF97316);
      case PriorityDotColor.red:
        return const Color(0xFFEF4444);
      case PriorityDotColor.green:
        return const Color(0xFF22C55E);
    }
  }
}