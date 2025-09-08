import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:save_idea/Constants/colors.dart';
import 'package:save_idea/Controller/note_controller.dart';
import 'package:save_idea/Model/note_model.dart';
import 'package:save_idea/View/note_detail.dart';

class YourNote extends StatelessWidget {
  final String title;
  final String description;
  final DateTime addtime;
  final int noteKey;

  const YourNote({
    super.key,
    required this.title,
    required this.description,
    required this.addtime,
    required this.noteKey,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NoteController>();
    final color = AppColors.cardColors[Random().nextInt(AppColors.cardColors.length)];

    return Slidable(
      key: ValueKey(noteKey),
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              Get.defaultDialog(
                title: 'Delete Note',
                middleText: 'Are you sure you want to delete this note?',
                textConfirm: 'Delete',
                textCancel: 'Cancel',
                onConfirm: () {
                  controller.deleteNote(noteKey);
                  Get.back(); // Close the dialog
                  Get.snackbar('Deleted', 'Your note has been deleted');
                },
              );
            },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () {
          Get.to(() => NoteDetail(
                note: NoteModel(
                  title: title,
                  describe: description,
                  addtime: addtime,
                ),
                noteKey: noteKey,
              ));
        },
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  maxLines: 10,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  DateFormat.yMMMd().format(addtime),
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}