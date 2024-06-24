import 'package:flutter/material.dart';

class AddNote extends StatelessWidget {
  const AddNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed:(){} ,icon:const Icon(Icons.link)),
          IconButton(onPressed:(){} ,icon:const Icon(Icons.share)),
          IconButton(onPressed:(){} ,icon:const Icon(Icons.more_horiz_sharp)),
        ],
        bottom:const PreferredSize(preferredSize:Size.fromHeight(1) , child:Divider()),
      ),
    );
  }
}