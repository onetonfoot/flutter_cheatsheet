import 'package:flutter/material.dart';

class Stuff extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stuff Page"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Press me"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
