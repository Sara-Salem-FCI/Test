import 'package:flutter/material.dart';

class Archieve extends StatelessWidget {
  const Archieve({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Archieved Tasks',
        style: TextStyle(
          color: Colors.white,
         fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
