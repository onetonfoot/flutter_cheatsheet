import 'package:flutter/material.dart';

class MySwitch extends StatefulWidget {
  MySwitch({this.title, this.icon, @required this.value});

  final Text title;
  final Icon icon;
  final bool value;

  @override
  _MySwitchState createState() => _MySwitchState();
}

class _MySwitchState extends State<MySwitch> {
  _MySwitchState();
  bool on;

  @override
  void initState() {
    super.initState();
    on = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
        title: widget.title,
        secondary: widget.icon,
        value: on,
        onChanged: (value) {
          setState(() {
            on = value;
          });
        });
  }
}

class Switches extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MySwitch(
          value: false,
          icon: Icon(Icons.lightbulb_outline),
          title: Text("Lights"),
        ),
        MySwitch(
          value: false,
          icon: Icon(Icons.linked_camera),
          title: Text("Something"),
        ),
      ],
    );
  }
}
