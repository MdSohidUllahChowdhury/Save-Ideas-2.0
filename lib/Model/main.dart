import 'package:flutter/material.dart';
import 'package:getx/View/screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(     
        useMaterial3: true,
      ),
      home:const GetxLeason(),
    );
  }
}