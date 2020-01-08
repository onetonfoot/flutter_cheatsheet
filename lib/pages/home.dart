import 'package:flutter/material.dart';
import 'package:flutter_cheatsheet/widgets/buttons.dart';
import 'package:flutter_cheatsheet/widgets/colours.dart';
import 'package:flutter_cheatsheet/widgets/column.dart';
import 'package:flutter_cheatsheet/widgets/http_request.dart';
import 'package:flutter_cheatsheet/widgets/images/network_image.dart';
import 'package:flutter_cheatsheet/widgets/layout/grid.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home Page"),
        ),
        body: ListView(
          padding: EdgeInsets.all(8),
          children: <Widget>[
            Button("Column", MyColumn()),
            Button("Colors", MyColors()),
            Button("Buttons", MyButtons()),
            Button("Grid", Grid()),
            Button("Network Image", MyNetworkImage()),
            Button("Http Request", MyHttpRequest())
          ],
        ));
  }
}

class Button extends StatelessWidget {
  final String text;
  final Widget widget;
  Button(this.text, this.widget);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 10),
        color: Colors.grey[300],
        height: 50,
        child: FlatButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => GenericPage(this.widget)));
          },
          child: Center(
              child: Text(
            this.text,
            style: TextStyle(fontSize: 24),
          )),
        ));
  }
}

class GenericPage extends StatelessWidget {
  final Widget widget;
  GenericPage(this.widget);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: widget,
    );
  }
}
