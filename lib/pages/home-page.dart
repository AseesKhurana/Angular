import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_training/Profile/user-profile.dart';
import 'package:flutter_training/constants/util.dart';
import 'package:flutter_training/pages/restaurants-page.dart';
import 'package:flutter_training/tutorials/google_maps.dart';
import 'package:flutter_training/tutorials/location-fetch.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int index = 0;


  List appBarName = [
    'Homaze',
    'Location',
    'Profile'
  ];

  List widgets = [
    RestaurantsPage(),
    FetchCurrentLocationPage(),
    UserProfile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(appBarName[index]),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.pushNamed(context, "/cart");
            },
            icon: Icon(Icons.shopping_cart),
            tooltip: "Favourites",
          ),
          IconButton(
            onPressed: (){
              Util.appUser = null;
              FirebaseAuth.instance.signOut();
              Navigator.pushNamed(context, "/login");
            },
            icon: Icon(Icons.logout),
            tooltip: "Log Out",
          )
        ],
      ),
      body: widgets[index],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon:  Icon(Icons.home),
              label: "HOME"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "SEARCH"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              label: "PROFILE"
          )
        ],
        currentIndex: index,
        selectedFontSize: 16,
        selectedItemColor: Colors.amber,
        onTap:(idx){
          setState((){
            index = idx;
          }
          );
        },
      ),
    );
  }
}