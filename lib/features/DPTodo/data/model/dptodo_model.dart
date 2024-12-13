import 'package:ca_firebase2_app/export.dart';

class DPTodo {
  final String id;
  final String title;
  final String description;
  final bool completed;
  final Timestamp timeStamp;

  DPTodo({
    required this.id,
    required this.title,
    required this.description,
    required this.completed,
    required this.timeStamp,
  });
}
