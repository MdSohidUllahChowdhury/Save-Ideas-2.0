import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:save_idea/Controller/Getx%20Practice/logicwithgetx.dart';
import 'package:save_idea/Controller/Getx%20Practice/result.dart';

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
             //Get.snackbar('Done', 'Counting Start Its Owne Point');
            Get.defaultDialog(
              title: 'Dialog',
              textCancel:'NO',
              textConfirm:'YES',
              content: const Text('DO YOU WANT TO RESET?')
            );
            },
             child:const Text('Reset')),
            
            const SizedBox(height: 20,),
             
             ElevatedButton(onPressed: () {
                //Navigator.push(context, //? Old ways
                //MaterialPageRoute(builder:
                // (context)=>  Result(result: hitGetx.startPoint.value,)
                // )
                //);
               
               //! New way to implement page routing using Getx
                  Get.to(()=>
                  const Result(),
                  
                  //* Easy way data pass
                  arguments:{
                    
                    'Name':'Sohid Chowdhury',
                    'Work_Status':'Active',
                    'Counter_value':hitGetx.startPoint.value,
                    'isPassed': true,
                 }

                );
              },
              child:const Text('Go to Result Page')),
          const  SizedBox( height: 15,),

          const SizedBox(height: 60,
             child:TextField(
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                  
                  ),
                  labelText: 'Idea'
                ),
               ),
           )
            
          ],
        ),
      )
    );
  }
}