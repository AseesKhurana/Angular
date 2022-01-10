import 'package:flutter/material.dart';

class HeroAnimation extends StatefulWidget {
  const HeroAnimation({Key? key}) : super(key: key);

  @override
  _HeroAnimationState createState() => _HeroAnimationState();
}

class _HeroAnimationState extends State<HeroAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hero Animation")),
      body: Container(
        width: 200,
        height: 200,
        child: InkWell(
          child: Hero(
            child: Image.network(
                "https://firebasestorage.googleapis.com/v0/b/fluttertraining-c67bb.appspot.com/o/dishes%2Fpexels-chevanon-photography-312418%201%201.png?alt=media&token=f257eb3f-08c8-4337-91bf-1fb0767b1c80"),
            tag: "tag-1",
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HeroPageTwo(),
                ));
          },
        ),
      ),
    );
  }
}

class HeroPageTwo extends StatelessWidget {
  const HeroPageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HERO PAGE ONE"),
      ),
      body: Center(
        child: InkWell(
          child: Hero(
            tag: "my-tag",
            child: Image.network(
                "https://firebasestorage.googleapis.com/v0/b/fluttertraining-c67bb.appspot.com/o/dishes%2Fpexels-chevanon-photography-312418%201%201.png?alt=media&token=f257eb3f-08c8-4337-91bf-1fb0767b1c80"),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
