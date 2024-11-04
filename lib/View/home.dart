import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:save_idea/Widgets/bar.dart';
import 'package:save_idea/Widgets/note_card.dart';
import 'package:save_idea/Controller/note_controller.dart';
import 'package:save_idea/View/addnote.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NoteController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: const Text(
            'YOUR NOTES',
            style: TextStyle(
                fontWeight: FontWeight.w900, letterSpacing: 3, fontSize: 20),
          ),
          centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            customBar(),
            const SizedBox(height: 25),
            Expanded(
              child: Obx(
                () => SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      controller.note.isEmpty
                          ? const Center(
                              child: Text('Create Your Note to Save'),
                            )
                          : ListView.builder(
                              itemCount: controller.note.length,
                              shrinkWrap: true,
                              primary: false,
                              reverse: true,
                              itemBuilder: (context, index) {
                                final note = controller.note[index];
                                return YourNote(
                                  title: note.title,
                                  description: note.describe,
                                  addtime: note.addtime,
                                  indexNo: index,
                                );
                              },
                            )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () => Get.to(() => const AddNote()),
          backgroundColor: const Color(0xffC4E538),
          label: const Text(
            'Add Note',
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w800, color: Colors.black),
          )),
    );
  }
}
