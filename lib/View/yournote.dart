import 'package:flutter/material.dart';

class YourNote extends StatelessWidget {
  const YourNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95,
      width: 325,
      margin:const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 230, 197, 197),
        borderRadius: BorderRadius.circular(26),
       
      ),
      child: ListTile(
        horizontalTitleGap: 0,
        titleAlignment:  ListTileTitleAlignment.top,
        

        title: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            
            const Text('Testing the note app',style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
            ),

            IconButton(onPressed:() {
              
            },icon:const Icon(Icons.delete_outline))
          ],
        ),

        subtitle: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Flutter is the best framework'),
            SizedBox(height:2,),

            Text('12:36 PM'),

          ],
        ),
        
      ),
    );
  }
}