import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Controller/Coustom Widget/bar.dart';
import 'package:getx/Controller/Coustom Widget/note_card.dart';
import 'package:getx/Controller/noteController.dart';
import 'package:getx/View/addnote.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

   final controller = Get.put(NoteController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:const Text('YOUR NOTES',
        style: TextStyle(
          fontWeight: FontWeight.w900,
          letterSpacing: 3,
          fontSize: 20),),
        centerTitle: true,

      ),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
         child:  Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
             const Bar(),
             
             const SizedBox(height: 25),
              
              Expanded(
               child: Obx(()=>SingleChildScrollView(
                  //scrollDirection: Axis.vertical,
                   child: Column(
                    children: [
                      controller.note.isEmpty ? 
                       const Center(
                       child: Text('Create Your Note to Save'),
                       ) 
                       :
                      ListView.builder(
                        itemCount:controller.note.length,
                        shrinkWrap: true,
                        primary: false,
                        itemBuilder: (context, index) {
                          final note = controller.note[index];
                          return 
                          YourNote(
                            title: note.title,
                             description: note.describe,
                             addtime: note.addtime,
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
      
      floatingActionButton:
       FloatingActionButton(onPressed:() => Get.to(const AddNote()),
       backgroundColor:const Color.fromARGB(255, 230, 197, 197),
       shape:const CircleBorder(),
       child:const Icon(Icons.add,size: 30,color: Colors.black,),),
    );
  }
}