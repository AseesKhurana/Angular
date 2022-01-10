import 'package:flutter/material.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      home: Friends(
      ),
    );
  }
}

class Friends extends StatefulWidget {
  const Friends({Key? key}) : super(key: key);

  @override
  _FriendsState createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  var backgroundColors = <String, Color>{
    "Monica": Colors.lightBlueAccent,
    "Rachel": Colors.orangeAccent,
    "Phoebe": Colors.lightGreenAccent,
    "Chandler": Colors.yellow,
    "Joey": Colors.deepPurpleAccent,
    "Ross": Colors.redAccent,
  };

  Color backgroundColor= Colors.grey;

  getWidgets(){
    var widgets = <Widget>[];
    backgroundColors.forEach((key, value) {
      widgets.add(SizedBox(
          height: 15));
      widgets.add(InkWell(
        child: Text(key, style: TextStyle(color: Colors.white, fontSize: 20),),
        onTap: (){
          setState(() {
            backgroundColor = value;
          });
        },
      ));
      widgets.add(Divider());
    });
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green,

        body: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/2,
              child: ListView(
                  children: getWidgets()
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/2,
              color: backgroundColor,
            ),
          ],

        )
    );
  }
}