import 'package:flutter/material.dart';

enum Gender{
  male,
  female,
  others
}

class RadioButton extends StatefulWidget {
  const RadioButton({Key? key}) : super(key: key);

  @override
  _RadioButtonState createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {

  Gender value = Gender.male;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CheckBox Tutorial")
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
