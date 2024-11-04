import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:save_idea/View/home.dart';

void main() {
  runApp((GetMaterialApp(
    theme: ThemeData(useMaterial3: true),
    debugShowCheckedModeBanner: false,
    home: const HomePage(),
  )));
}