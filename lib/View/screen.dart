import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Controller/logicwithgetx.dart';

class GetxLeason extends StatelessWidget {
  const GetxLeason({super.key});

  @override
  Widget build(BuildContext context) {
    
    final hitGetx = Get.put(Counting());
    
    return (
      Scaffold(
        appBar: AppBar(
          title: const Text('Getx State'),
        ),

        body:Column(
          children: [
            
             Obx(
              (){
              return Text(hitGetx.startPoint.value.toString(),
                      style:const TextStyle(fontSize: 100),);
             }
             ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                IconButton(onPressed:()=>hitGetx.increment(),

                icon: const Icon(Icons.add_circle,size: 40,color: Colors.green,)
                ),

                 IconButton(onPressed:()=>hitGetx.decrement(),
                icon: const Icon(Icons.remove_circle,size: 40,color: Colors.red,)
                ),
                
              ],
            ),
            ElevatedButton(onPressed: () {
             hitGetx.startPoint.value = 0;
            },
             child:const Text('Reset'))
            
          ],
        ),
      )
    );
  }
}