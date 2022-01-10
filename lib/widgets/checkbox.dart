import 'package:flutter/material.dart';

class CheckBox extends StatefulWidget {
  const CheckBox({Key? key}) : super(key: key);

  @override
  _CheckBoxState createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CheckBox")
      ),
      body: Center(
        child: CheckboxListTile(
          title: Text("Java"),
          subtitle: Text("Java and JEE Technology"),
          value: isChecked,
          onChanged: (value){
            setState(() {
              isChecked = value as bool;
            });
          },
        ),
      ),
    );
  }
}
