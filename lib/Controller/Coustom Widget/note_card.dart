import 'package:flutter/material.dart';
import 'package:get/get.dart';

class YourNote extends StatelessWidget {
  final String title;
  final String description;
  final DateTime addtime;
  
  const YourNote({super.key,
  
  required this.title,
  required this.description, 
  required this.addtime});

  @override
  Widget build(BuildContext context) {
    
    return Container(
      height: 95,
      width: Get.width*9,
      margin:const EdgeInsets.only(bottom: 8),
      
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 230, 197, 197),
        borderRadius: BorderRadius.circular(26),
      ),

      child: ListTile(
        horizontalTitleGap:0,
        titleAlignment:  ListTileTitleAlignment.top,

        title:Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
           children: [
            
             Text(title,
              style:const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
               ),
              ),

             IconButton(
              onPressed:(){},
              icon:const Icon(Icons.delete_outline)),
          
          ],
        ),

        subtitle:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
            
            Text(
              description,
              maxLines: 1, 
              overflow: TextOverflow.ellipsis,
                ),
          const  SizedBox(height:2),

            Text(addtime.toString()),

          ],
        ),
        
      ),
    );
  }
}