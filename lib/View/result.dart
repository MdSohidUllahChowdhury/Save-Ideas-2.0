import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int result;
  const Result({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Result'),
      ),

      body: Center(
        child: Text('The Result :$result '),
      ),
    );
  }
}