import 'package:get/get.dart';
import 'package:save_idea/Model/note_model.dart';

class NoteController extends GetxController {
  
  RxList<NoteModel> note = <NoteModel>[].obs;

  mainNoteModel(NoteModel noteData) {
    note.add(noteData);
    update();
  }

  deleteNote(int index) {
    note.removeAt(index);
    update();
  }
}
