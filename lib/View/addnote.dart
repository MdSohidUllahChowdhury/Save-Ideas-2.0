import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Controller/noteController.dart';
import 'package:getx/Controller/noteModel.dart';



class AddNote extends StatelessWidget {

 const  AddNote({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = NoteController();
    final  titleController = TextEditingController();
    final  descriptionController = TextEditingController();


    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        actions: [
          IconButton(onPressed:(){} ,icon:const Icon(Icons.link)),
          IconButton(onPressed:(){} ,icon:const Icon(Icons.share)),
          IconButton(onPressed:(){} ,icon:const Icon(Icons.more_horiz_sharp)),
        ],
        bottom:const PreferredSize(preferredSize:Size.fromHeight(1) , child:Divider()),
      ),

      body:  Padding(
        padding: const EdgeInsets.all(12.0),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             TextField(
              controller: titleController,
              style:const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                
              ),
              maxLines: 2,
              minLines: 1,
              decoration:const  InputDecoration(
                hintText: 'Note Title',
                border: InputBorder.none,
              ),
            ),

             Expanded(
              child: TextField(
                controller: descriptionController ,
                maxLines: 50,
                minLines: 50,
                decoration:const InputDecoration(
                  hintText: 'Discribe Your Notes...',
                  border: InputBorder.none,
                ),
              ),
            ),

           InkWell(
             onTap: () {
                    
                    if (
                      titleController.text.isEmpty || descriptionController.text.isEmpty 
                    ){
                     Get.snackbar(duration: const Duration(seconds: 5),
                        'Empty File', 'Create Your Note', );
                    }
                    else{
                      //print('Hello');
                      controller.mainNoteModel(NoteModel(
                        title: titleController.text, 
                        describe:descriptionController.text,
                         addtime: DateTime.now()));
                      
                      Get.back(); 
                    }
                  
                  },
             child: Container(
                height: 45,
                width: 325,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 230, 197, 197),
                  borderRadius: BorderRadius.circular(16)
                ),
                child: const Center(child: Text('Save Your Note',
                style:TextStyle(
                  letterSpacing: 2,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.black
                ) ,)),
             ),
           ) 
          ],
        ),
      ),
    );
  }
}