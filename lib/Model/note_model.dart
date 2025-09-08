import 'package:hive/hive.dart';

part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String describe;

  @HiveField(2)
  final DateTime addtime;

  @HiveField(3)
  final DateTime? updatetime;

  NoteModel({
    required this.title,
    required this.describe,
    required this.addtime,
    this.updatetime,
  });
}
