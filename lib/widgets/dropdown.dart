import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  const DropDown({Key? key}) : super(key: key);

  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {

  getDropDownItems(){
    return ['Select City', 'Ludhiana', 'Chandigarh', 'Delhi', 'Bangalore', 'Mumbai', 'Lahore'].map(
            (String city) {
              return DropdownMenuItem(child: Text(city), value: city);
            }
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drop Down")
      ),
      body: Center(
        child: DropdownButton(
          icon: Icon(Icons.keyboard_arrow_down_sharp),
          items: getDropDownItems(),
          iconSize: 20.0,
          onChanged: (newValue){
            setState(() {

            });
          },
        ),
      )
    );
  }
}
