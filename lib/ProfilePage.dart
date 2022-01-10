import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Profile Page"),
        ),
        body: ProfilePage(),
      ),
    );
  }
}


class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 200),
          Text("Chandler Bing",
              style: TextStyle(fontSize: 21,color: Colors.blue)
          ),
          SizedBox(height: 10),
          Text("Job - Statistical Analysis and Data Reconfiguration",
              style: TextStyle(fontSize: 15,color: Colors.lightBlueAccent)
          ),
          SizedBox(height: 30),
          Container(
            height: 175,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
            color: Colors.lightGreen,
            padding: EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 40),
                Text("Followers"),
                SizedBox(width: 50),
                Text("Following"),
                SizedBox(width: 50),
                Text("Articles"),
                SizedBox(height: 30)
              ],
            ),
          )
        ],
      ),
    );
  }
}