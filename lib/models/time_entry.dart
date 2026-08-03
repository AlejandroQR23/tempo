import 'package:uuid/uuid.dart';

class TimeEntry {
  final String id;
  final String appGroupId;
  final String labelId;
  final DateTime startTime;
  final DateTime? endTime;

  TimeEntry({
    required this.appGroupId,
    required this.labelId,
    required this.startTime,
    this.endTime,
    String? id,
  }) : id = id ?? const Uuid().v4();

  TimeEntry copyWith({
    String? appGroupId,
    String? labelId,
    DateTime? startTime,
    DateTime? endTime,
  }) {
    return TimeEntry(
      appGroupId: appGroupId ?? this.appGroupId,
      labelId: labelId ?? this.labelId,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      id: id,
    );
  }
}
