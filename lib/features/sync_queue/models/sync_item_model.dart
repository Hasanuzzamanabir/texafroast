import 'package:flutter/material.dart';

enum SyncItemStatus { completed, failed, pending }

class SyncQueueItemModel {
  final String title;
  final String subtitle;
  final IconData icon;
  final SyncItemStatus status;

  const SyncQueueItemModel({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.status,
  });
}