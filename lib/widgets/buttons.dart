import 'package:flutter/material.dart';
import 'package:flutter_cheatsheet/widgets/buttons/switch.dart';
import 'package:flutter_cheatsheet/widgets/buttons/radio.dart';

class MyButtons extends StatelessWidget {
  String dropddownValue = "One";

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(8),
      children: <Widget>[
        RaisedButton(
          child: Text("Raised Button"),
          onPressed: () {},
        ),
        FlatButton(
          color: Colors.grey,
          child: Text("Flat Button"),
          onPressed: () {},
        ),
        Container(
          color: Colors.black,
          child: IconButton(
            color: Colors.white,
            icon: Icon(Icons.local_atm),
            onPressed: () {},
          ),
        ),
        Center(child: Dropdown()),
        RadioButtonGroup(),
        Switches(),
      ],
    );
  }
}

class Dropdown extends StatefulWidget {
  Dropdown({Key key}) : super(key: key);

  @override
  _DropdownState createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      elevation: 10,
      style: TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
        color: Colors.black,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: ['One', 'Two', 'Free', 'Four'].map((value) {
        return DropdownMenuItem(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
