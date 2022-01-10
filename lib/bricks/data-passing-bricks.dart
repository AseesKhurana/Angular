import 'package:flutter/material.dart';
import 'package:flutter_training/bricks/program.dart';

class Bricks{
  int target;

  Bricks(this.target);

  @override
  String toString() {
    return 'bricks{target: $target}';
  }
}

class BricksNumber extends StatefulWidget {
  BricksNumber({Key? key}) : super(key: key);

  @override
  _BricksNumberState createState() => _BricksNumberState();
}

class _BricksNumberState extends State<BricksNumber> {
  TextEditingController controllerBricks= new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Brick Wall"),
          backgroundColor: Colors.lightBlue,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Enter the number of Bricks to place in the wall", style: TextStyle(fontSize: 16, color: Colors.blueAccent),),
                      SizedBox(height: 10),
                      TextField(
                        controller: controllerBricks,
                      ),
                      SizedBox(height: 10),
                      InkWell(
                        child: Text("SUBMIT"),
                        onTap: (){
                          Bricks bricks= new Bricks(int.parse(controllerBricks.text));
                          bricks.target= int.parse(controllerBricks.text);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => BricksProgram(bricks: bricks)));
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}

class BricksProgram extends StatelessWidget {
  Bricks? bricks;

  BricksProgram({Key? key, this.bricks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Brick Wall"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: jackjohn(bricks!.target),
      ),
    );
  }
}