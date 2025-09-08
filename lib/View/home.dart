import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:save_idea/Constants/colors.dart';
import 'package:save_idea/Widgets/note_card.dart';
import 'package:save_idea/Controller/note_controller.dart';
import 'package:save_idea/View/addnote.dart';
import 'package:save_idea/Model/note_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NoteController controller = Get.put(NoteController());
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: _buildAppBar(),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: MasonryGridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            itemCount: controller.filteredNotes.length,
            itemBuilder: (context, index) {
              final noteData = controller.filteredNotes[index];
              final note = noteData['note'] as NoteModel;
              final key = noteData['key'] as int;
              return YourNote(
                title: note.title,
                description: note.describe,
                addtime: note.addtime,
                noteKey: key,
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddNote(
                note: NoteModel(
                  title: '',
                  describe: '',
                  addtime: DateTime.now(),
                ),
              ));
        },
        backgroundColor: AppColors.accentColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.primaryColor,
      elevation: 0,
      title: _isSearching
          ? TextField(
              controller: _searchController,
              autofocus: true,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: 'Search notes...',
                hintStyle: TextStyle(color: Colors.white70),
                border: InputBorder.none,
              ),
              onChanged: (query) {
                controller.searchQuery.value = query;
              },
            )
          : const Text(
              'Save Ideas',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
      actions: [
        IconButton(
          onPressed: () {
            setState(() {
              _isSearching = !_isSearching;
              if (!_isSearching) {
                _searchController.clear();
                controller.searchQuery.value = '';
              }
            });
          },
          icon: Icon(
            _isSearching ? Icons.close : Icons.search,
            color: Colors.white,
          ),
        ),
        if (!_isSearching)
          PopupMenuButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: const Text('Light'),
                onTap: () => Get.changeThemeMode(ThemeMode.light),
              ),
              PopupMenuItem(
                child: const Text('Dark'),
                onTap: () => Get.changeThemeMode(ThemeMode.dark),
              ),
              PopupMenuItem(
                child: const Text('System'),
                onTap: () => Get.changeThemeMode(ThemeMode.system),
              ),
            ],
          ),
      ],
    );
  }
}