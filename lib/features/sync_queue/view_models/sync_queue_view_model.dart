import 'package:flutter/material.dart';
import '../models/sync_item_model.dart';

class SyncQueueViewModel extends ChangeNotifier {
  bool _isSyncing = false;
  int _pendingSyncCount = 0; // Default 0 as per Figma Offline Queue screen

  final List<SyncQueueItemModel> _pendingQueue = const [
    SyncQueueItemModel(
      title: 'Safety Checklist',
      subtitle: '12 items completed · Synced local',
      icon: Icons.check_circle_rounded,
      status: SyncItemStatus.completed,
    ),
    SyncQueueItemModel(
      title: 'Compressor Photos',
      subtitle: '3 high-res images uploading (Failed segment)',
      icon: Icons.image_outlined,
      status: SyncItemStatus.failed,
    ),
    SyncQueueItemModel(
      title: 'Technician Diagnostics Note',
      subtitle: 'Condenser coil wear-and-tear logs',
      icon: Icons.description_outlined,
      status: SyncItemStatus.pending,
    ),
    SyncQueueItemModel(
      title: 'Customer Signature Capture',
      subtitle: 'Sign-off authorization saved as vector path',
      icon: Icons.draw_outlined,
      status: SyncItemStatus.pending,
    ),
  ];

  bool get isSyncing => _isSyncing;
  int get pendingSyncCount => _pendingSyncCount;
  List<SyncQueueItemModel> get pendingQueue => _pendingQueue;

  Future<void> forceSync() async {
    _isSyncing = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));

    _isSyncing = false;
    notifyListeners();
  }
}