import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:save_idea/Constants/themes.dart';
import 'package:save_idea/Model/note_model.dart';
import 'package:save_idea/View/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>('notes');

  runApp((GetMaterialApp(
    theme: AppThemes.lightTheme,
    darkTheme: AppThemes.darkTheme,
    themeMode: ThemeMode.system,
    debugShowCheckedModeBanner: false,
    home: const HomePage(),
  )));
}
