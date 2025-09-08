import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:save_idea/Constants/colors.dart';
import 'package:save_idea/Controller/note_controller.dart';
import 'package:save_idea/Model/note_model.dart';
import 'package:share_plus/share_plus.dart';

class AddNote extends StatelessWidget {
  final NoteModel? note;
  final int? noteKey;

  const AddNote({super.key, this.note, this.noteKey});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NoteController());
    final titleController = TextEditingController(text: note?.title);
    final descriptionController =
        TextEditingController(text: note?.describe);

    void showMoreOptions() {
      Get.bottomSheet(
        Container(
          color: AppColors.secondaryColor,
          child: Wrap(
            children: <Widget>[
              if (noteKey != null)
                ListTile(
                  leading: const Icon(Icons.delete, color: Colors.white),
                  title: const Text('Delete', style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Get.back(); // Close the bottom sheet
                    Get.defaultDialog(
                      title: 'Delete Note',
                      middleText: 'Are you sure you want to delete this note?',
                      textConfirm: 'Delete',
                      textCancel: 'Cancel',
                      onConfirm: () {
                        controller.deleteNote(noteKey!);
                        Get.back(); // Close the dialog
                        Get.back(); // Go back to home screen
                        Get.snackbar('Deleted', 'Your note has been deleted');
                      },
                    );
                  },
                ),
              ListTile(
                leading: const Icon(Icons.copy, color: Colors.white),
                title: const Text('Duplicate', style: TextStyle(color: Colors.white)),
                onTap: () {
                  final newNote = NoteModel(
                    title: titleController.text,
                    describe: descriptionController.text,
                    addtime: DateTime.now(),
                  );
                  controller.addNote(newNote);
                  Get.back(); // Close the bottom sheet
                  Get.snackbar('Duplicated', 'Note has been duplicated');
                },
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Clipboard.setData(ClipboardData(
                        text:
                            '${titleController.text}\n\n${descriptionController.text}')).then((_) {
                  Get.snackbar('Copied', 'Note copied to clipboard');
                });
              },
              icon: const Icon(Icons.link, color: Colors.white)),
          IconButton(
              onPressed: () {
                Share.share(
                    '${titleController.text}\n\n${descriptionController.text}');
              },
              icon: const Icon(Icons.share, color: Colors.white)),
          IconButton(
              onPressed: showMoreOptions,
              icon: const Icon(Icons.more_horiz_sharp, color: Colors.white)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              decoration: const InputDecoration(
                hintText: 'Title',
                hintStyle: TextStyle(color: Colors.white70),
                border: InputBorder.none,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: TextField(
                controller: descriptionController,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
                maxLines: null,
                decoration: const InputDecoration(
                  hintText: 'Start typing...', 
                  hintStyle: TextStyle(color: Colors.white70),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (titleController.text.isEmpty ||
              descriptionController.text.isEmpty) {
            Get.snackbar(
              'Empty Note',
              'Please enter a title and description.',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red,
              colorText: Colors.white,
            );
          } else {
            final newNote = NoteModel(
              title: titleController.text,
              describe: descriptionController.text,
              addtime: note?.addtime ?? DateTime.now(),
              updatetime: DateTime.now(),
            );
            if (noteKey != null) {
              controller.updateNote(noteKey!, newNote);
            } else {
              controller.addNote(newNote);
            }
            Get.back();
          }
        },
        backgroundColor: AppColors.accentColor,
        label: Text(
          noteKey == null ? 'Save' : 'Update',
          style: const TextStyle(color: Colors.white),
        ),
        icon: const Icon(
          Icons.save,
          color: Colors.white,
        ),
      ),
    );
  }
}