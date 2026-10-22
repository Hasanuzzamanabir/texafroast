class ScheduleSlotModel {
  final String time;
  final String? title;
  final String? serviceTag;
  final String? duration;

  const ScheduleSlotModel({
    required this.time,
    this.title,
    this.serviceTag,
    this.duration,
  });

  bool get hasJob => title != null;
}