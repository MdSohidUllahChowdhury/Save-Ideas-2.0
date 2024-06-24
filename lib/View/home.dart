import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Controller/bar.dart';
import 'package:getx/Controller/yournote.dart';
import 'package:getx/View/addnote.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
        padding:  const EdgeInsets.all(10.0),
        child:  Column(mainAxisAlignment: MainAxisAlignment.start,
          children: [
             const Bar(),
             const SizedBox(height: 20,),
             
              Expanded(
               child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                 child: Column(
                  children: [
                    ListView.builder(
                      itemCount: 3,
                      shrinkWrap: true,
                      primary: true,
                      itemBuilder: (context, index) {
                        return const YourNote();
                      },)
                  ],
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