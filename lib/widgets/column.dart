import 'package:flutter/material.dart';

class MyColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        colA(Colors.amber, CrossAxisAlignment.center),
        colA(Colors.red, CrossAxisAlignment.start),
        colA(Colors.blue, CrossAxisAlignment.end),
      ],
    );
  }
}

colA(MaterialColor color, CrossAxisAlignment alignment) {
  return Container(
    color: color[200],
    child: Column(
      crossAxisAlignment: alignment,
      children: <Widget>[
        myBoxA(color),
        myBoxA(color),
        myBoxA(color),
        myBoxA(color),
      ],
    ),
  );
}

Container myBoxA(MaterialColor color) {
  return Container(
    margin: const EdgeInsets.all(10.0),
    color: color[600],
    width: 48,
    height: 48,
  );
}
