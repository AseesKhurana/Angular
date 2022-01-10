import 'package:flutter/material.dart';

final Color darkBlue = Color.fromARGB(255, 255, 255, 255);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Homepage(),
        ),
      ),
    );
  }
}


class Homepage extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child:
        Column(
          children:[

            Text("Ketan Goyal", style: TextStyle(color: Colors.black, fontSize: 50)),
            Text("Username:  Ketan4643", style: TextStyle(color: Colors.black38, fontSize: 20)),


            Container(height: 300,
              width: 300,
              padding: EdgeInsets.all(20),
              decoration:BoxDecoration(
                borderRadius:BorderRadius.circular(10),
                color: Colors.lightGreenAccent,
              ),


              child :
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,

                      children:[
                        Text("Followers", style: TextStyle(color: Colors.green, fontSize: 20,)),


                        Text("Following", style: TextStyle(color: Colors.green, fontSize: 20,)),


                        Text("Articles", style: TextStyle(color: Colors.green, fontSize: 20,)),
                      ]
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:[
                        Text("20"),


                        Text("2"),


                        Text("5"),
                      ]
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,

                    children: [
                      Align(
                          alignment: Alignment.bottomCenter,
                          child:
                          Text("Explore More!",style: TextStyle(color: Colors.green, fontSize: 30,fontWeight: FontWeight.w500 ))
                      ),],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(child:
                      Container(
                          height: 40,
                          width: 100,
                          padding: EdgeInsets.all(8),
                          decoration:BoxDecoration(
                            borderRadius:BorderRadius.circular(10),
                            color: Colors.green,
                          ),
                          child:
                          Center(child:Text("Tap"))

                      ),
                        onTap: (){},
                      )
                    ],
                  ),
                ],


              ),


            )

          ],
        ),
      ),




    );
  }
}