class NoteModel {
  final String title;
  final String describe;
  final DateTime addtime;
  final DateTime? updatetime;

  NoteModel({
    required this.title,
    required this.describe,
    required this.addtime,
    this.updatetime,
  });
}
