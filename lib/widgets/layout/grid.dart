import 'package:flutter/material.dart';

class Grid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      padding: EdgeInsets.all(4.0),
      children: [50, ...List.generate(9, (i) => (i + 1) * 100)]
          .map((i) => Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.blue[i],
                    border: Border.all(color: Colors.black, width: 1.0)),
              ))
          .toList(),
    );
  }
}
