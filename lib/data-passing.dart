import 'package:flutter/material.dart';

class User{
  String? uid;
  String? name;

  User({this.name, this.uid});

  @override
  String toString(){
    return uid! + "" + name!+"\n";
  }
}

class PageOne extends StatefulWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {

  String title = "Page One";
  late TextEditingController? contolleruid = TextEditingController();
  late TextEditingController? controllername = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Enter details of user"),
            SizedBox(height: 10),
            TextField(
              controller: contolleruid
            ),
            SizedBox(height: 10),
            TextField(
              controller: controllername,
            ),
            SizedBox(height: 10),
            InkWell(
              child: Text("Submit"),
              onTap: () async {
                User user = new User();
                user.uid = contolleruid!.text;
                user.name = controllername!.text;
                Navigator.pushNamed(context, "/two", arguments: user);
              },
            )
          ],
        ),
      ),
    );
  }
}

class PageTwo extends StatelessWidget {


  //PageTwo({Key? key, this.user}) : super(key: key);
  PageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    User user = ModalRoute.of(context)!.settings.arguments as User;

    return Scaffold(
        appBar: AppBar(
          title: Text("Page Two"),
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(user.uid.toString()),
                SizedBox(height: 10,),
                Text(user.name.toString()),
                InkWell(
                  child: Text("DONE"),
                  onTap: (){
                    User user = new User(uid: "XYZ987", name: "Fionna Flynn");
                    // Return the data from Current Page to the Previous Page
                    //Navigator.pop(context, "Thank You");
                    Navigator.pop(context, user);
                  },
                )
              ],
            )
        )
    );
  }
}