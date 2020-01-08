import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<User>> fetchUsers() async {
  final url = "https://jsonplaceholder.typicode.com/posts";
  final response = await http.get(url);

  if (response.statusCode == 200) {
    return json
        .decode(response.body)
        .map<User>((u) => User.fromJson(u))
        .toList();
  } else {
    throw Exception("Failed to load users");
  }
}

class MyHttpRequest extends StatefulWidget {
  @override
  _NetworkImageState createState() => _NetworkImageState();
}

// This widget perform the HTTP request every time it's loaded
// is better to use a reposity pattern. Nevertheless it illustrates
// how to use future builder and a lazy list view

class _NetworkImageState extends State<MyHttpRequest> {
  Future<List<User>> users;

  @override
  void initState() {
    super.initState();
    users = fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: users,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) => Container(
                color: Colors.blueGrey[100],
                child: ListTile(title: Text(snapshot.data[index].title)),
              ),
              separatorBuilder: (BuildContext context, int index) => Divider(
                color: Colors.white,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class User {
  final int userId;
  final int id;
  final String title;
  final String body;

  User(this.userId, this.id, this.title, this.body);

  User.fromJson(Map<String, dynamic> json)
      : userId = json['userId'],
        id = json['id'],
        title = json['title'],
        body = json['body'];

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'id': id,
        'title': title,
        'body': body,
      };
}
