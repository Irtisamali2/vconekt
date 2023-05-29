import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class MyScreen extends StatefulWidget {
  @override
  _MyScreenState createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  List<String> users = [];

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:3000/api/users'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        users = List<String>.from(data);
      });
    } else {
      print('Failed to fetch data');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Example'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(users[index]),
        ),
      ),
    );
  }
}
