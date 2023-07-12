import 'package:flutter/material.dart';

class LinearBackground extends StatelessWidget {
  const LinearBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(0.8, 1),
            colors: <Color>[
              Color(0xff4b39ef),
              Color.fromARGB(180, 255, 89, 100),
              Color.fromARGB(84, 238, 138, 96),             
            ], // Gradient from https://learnui.design/tools/gradient-generator.html
            tileMode: TileMode.mirror,
          ),
        ),
        // child: const Center(
        //   child: Text(
        //     'From Night to Day',
        //     style: TextStyle(fontSize: 24, color: Colors.white),
        //   ),
        // ),
      ),
    );
  }
}