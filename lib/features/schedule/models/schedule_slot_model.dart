class ScheduleSlotModel {
  final String time;
  final String? title;
  final String? address;
  final String? arrivalWindow;
  final String? assignedTechnician;
  final String? status;
  final String? serviceTag;
  final String? duration;
  final String? jobId;

  const ScheduleSlotModel({
    required this.time,
    this.title,
    this.address,
    this.arrivalWindow,
    this.assignedTechnician,
    this.status,
    this.serviceTag,
    this.duration,
    this.jobId,
  });

  bool get hasJob => title != null;
}