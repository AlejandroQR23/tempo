import 'package:uuid/uuid.dart';

class Label {
  final String name;
  final String id;

  Label({required this.name, String? id}) : id = id ?? const Uuid().v4();

  Label copyWith({String? name}) {
    return Label(name: name ?? this.name, id: id);
  }
}
