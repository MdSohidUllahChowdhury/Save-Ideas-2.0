import 'package:flutter/material.dart';
import 'package:getx/View/bar.dart';
import 'package:getx/View/yournote.dart';

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
                      itemCount: 10,
                      shrinkWrap: true,
                      primary: true,
                      itemBuilder: (context, index) {
                        return const YourNote();
                      },)
                  ],
                 ),
               ),
             )
                
          ],
        ),
      ),
    );
  }
}