import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:save_idea/Model/note_model.dart';

class NoteController extends GetxController {
  final Box<NoteModel> _noteBox = Hive.box<NoteModel>('notes');
  RxList<Map<String, dynamic>> notes = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> filteredNotes = <Map<String, dynamic>>[].obs;
  RxString searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadNotes();
    searchQuery.listen((query) {
      filterNotes(query);
    });
  }

  void loadNotes() {
    final notesWithKeys = _noteBox.keys.map((key) {
      final note = _noteBox.get(key);
      return {'note': note, 'key': key};
    }).toList();
    notes.assignAll(notesWithKeys);
    filteredNotes.assignAll(notes);
  }

  void filterNotes(String query) {
    if (query.isEmpty) {
      filteredNotes.assignAll(notes);
    } else {
      filteredNotes.assignAll(notes.where((noteData) {
        final note = noteData['note'] as NoteModel;
        return note.title.toLowerCase().contains(query.toLowerCase()) ||
            note.describe.toLowerCase().contains(query.toLowerCase());
      }).toList());
    }
  }

  void addNote(NoteModel noteData) {
    _noteBox.add(noteData);
    loadNotes();
  }

  void updateNote(int key, NoteModel noteData) {
    _noteBox.put(key, noteData);
    loadNotes();
  }

  

  void deleteNote(int key) {
    _noteBox.delete(key);
    loadNotes();
  }
}
