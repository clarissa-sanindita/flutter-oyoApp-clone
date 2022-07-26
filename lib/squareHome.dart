import 'package:flutter/material.dart';

class squareHome extends StatelessWidget {
  const squareHome({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.8),
      child: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color.fromARGB(255, 103, 103, 103),
        ),
      ),
      
    );
  }
}