import 'package:flutter/material.dart';

class ListViewDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10),
      children: <ListTile>[
        ListTile(
          title: Text("TextCrunch"),
          subtitle: Text("All headlines from TextCrunch"),
          leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text("TC"),
            ),
          ),
          trailing: Icon(Icons.keyboard_arrow_right_rounded),
          onTap: (){}
        ),
        ListTile(
          title: Text("Wall Street"),
          subtitle: Text("All headlines from Wall Street"),
          leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.blueGrey,
            shape: BoxShape.circle,
            ),
          child: Center(
            child: Text("WS"),
          ),
          ),
          trailing: Icon(Icons.keyboard_arrow_right_rounded),
          onTap: (){}
        ),
        ListTile(
          title: Text("India"),
          subtitle: Text("All headlines from India"),
            leading: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text("IND"),
              ),
            ),
          trailing: Icon(Icons.keyboard_arrow_right_rounded),
          onTap: (){}
        )
      ],
    );
  }
}

var newsData = <Map<String,String>>[
  {
    "title": "TechCrunch",
    "subtitle": "All headlines from TextCrunch"
  },
  {
    "title": "Wall Street",
    "subtitle": "All headlines from Wall Street"
  },
  {
    "title": "India",
    "subtitle": "All headlines from India"
  }
  ];
