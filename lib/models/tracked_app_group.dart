import 'package:uuid/uuid.dart';

class TrackedAppGroup {
  final String name;
  final List<String> apps;
  final String id;

  TrackedAppGroup({required this.name, required this.apps, String? id})
    : id = id ?? const Uuid().v4();

  TrackedAppGroup copyWith({String? name, List<String>? apps}) {
    return TrackedAppGroup(
      name: name ?? this.name,
      apps: apps ?? this.apps,
      id: id,
    );
  }
}
