import 'package:flutter/material.dart';

enum Chicken { fried, popcorn, jerk }

class RadioButtonGroup extends StatefulWidget {
  @override
  _RadioButtonGroupState createState() => _RadioButtonGroupState();
}

class _RadioButtonGroupState extends State<RadioButtonGroup> {
  var _chicken = Chicken.jerk;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey[100],
      child: Column(
          children: [Chicken.jerk, Chicken.popcorn, Chicken.fried]
              .map((c) => ListTile(
                    title: Text(c.toString().split(".")[1]),
                    leading: Radio(
                        value: c,
                        groupValue: _chicken,
                        onChanged: (value) {
                          setState(() {
                            _chicken = value;
                          });
                        }),
                  ))
              .toList()),
    );
  }
}
