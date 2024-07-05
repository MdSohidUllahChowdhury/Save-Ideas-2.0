import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Bar extends StatelessWidget {
  const Bar({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    
      children: [
        
        IconButton(
          onPressed:(){
             Get.snackbar('Working',
                 'Work is on for this feature');
          },
          icon:const Icon(Icons.menu_sharp)),
        
        Row(
          children: [
            IconButton(
              onPressed:(){
                Get.snackbar('Working',
                 'Work is on for this feature');
              }, 
              icon: const Icon(Icons.search)),

            IconButton(
              icon: const Icon(Icons.settings),
              onPressed:(){
                Get.bottomSheet(
                  Container(
                    height: 75,
                    width: 330,
                    margin:const EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                      color: Colors.pink[100],
                      borderRadius: BorderRadius.circular(26)
                    ),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed:(){
                             Get.changeTheme( Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
                             },
                          icon:const Icon(Icons.light_mode)
                          ),

                          IconButton(
                          onPressed:(){
                            Get.changeTheme( Get.isDarkMode ? ThemeData.dark() : ThemeData.light());
                            },
                          icon:const Icon(Icons.dark_mode)
                          ),
                      ],
                    ),
                  )
                );
              },
              ),
                  ],
        )

      ],
    );
  }
}