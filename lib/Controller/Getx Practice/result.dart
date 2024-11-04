import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Result extends StatelessWidget {
  
  const Result({super.key,});

  @override
  Widget build(BuildContext context) {
    
   final result = Get.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        title:const Text('Result'),
      ),

      body: Column(mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text('NAME: ${result['Name']}\nSTATUS: ${result['Work_Status']}\nCOUNTING VALUE: ${result['Counter_value']}'),
          ),
          Icon(
            result['isPassed']? Icons.check_circle :  Icons.error,
            color: result['isPassed']?  Colors.green :  Colors.red)
        ],
      ),
    );
  }
}