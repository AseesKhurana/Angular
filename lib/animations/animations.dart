import 'dart:math';

import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({Key? key}) : super(key: key);

  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {

  Color color = Colors.green;
  double borderRadius = 2;
  double margin = 2;

  void updateAttributes(){
    color = Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));
    borderRadius = Random().nextDouble() * 64;
    margin = Random().nextDouble() * 64;
  }
  // Constructor
  @override
  void initState() {
    super.initState();
    updateAttributes();
  }
  // Destructor
  @override
  void dispose() {
    super.dispose();
    animateContainer(){
      setState(() {
        updateAttributes();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animations")
      ),
      body: Center(
        child: Column(
          children: [
            AnimatedContainer(
              height: 256,
              width: 256,
              duration: Duration(milliseconds: 1000),
              margin: EdgeInsets.all(margin),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(borderRadius)
              )
            ),
            TextButton(
                onPressed: (){

                },
                child: Text("Animate")
            )
          ]
        )
      )
    );
  }
}
