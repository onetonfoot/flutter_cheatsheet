import 'package:flutter/material.dart';

class MyColors extends StatelessWidget {
  List<Widget> _colors(MaterialColor color) {
    return [50, ...List.generate(9, (i) => (i + 1) * 100)]
        .map<Container>((i) => Container(
              color: color[i],
              height: 70,
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _colors(Colors.blueGrey),
    );
  }
}
