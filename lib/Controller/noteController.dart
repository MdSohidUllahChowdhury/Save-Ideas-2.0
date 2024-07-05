// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:getx/Controller/noteModel.dart';

class NoteController extends GetxController{

RxList<NoteModel> note = <NoteModel>[].obs;
  
  mainNoteModel(NoteModel noteData)
  {
    note.add(noteData);
    update();
  }

  deleteNote(int index){
    note.removeAt(index);
    update();
  }

}