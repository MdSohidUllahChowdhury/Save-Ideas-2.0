import 'package:flutter/material.dart';

class Bar extends StatelessWidget {
  const Bar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
    
      children: [
        IconButton(onPressed:() {}, icon:const Icon(Icons.menu_sharp)),
        
        Row(
          children: [
            IconButton(onPressed:(){} , icon: const Icon(Icons.search)),
             IconButton(onPressed:(){} , icon: const Icon(Icons.more_vert_outlined)),
          ],
        )

      ],
    );
  }
}