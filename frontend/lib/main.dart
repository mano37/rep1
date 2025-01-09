import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter + Flask',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _status = "Unknown";

  Future<void> _checkBackend() async {
    final response =
        await http.get(Uri.parse('http://<YOUR_BACKEND_URL>:5000/api/health'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _status = data['status'];
      });
    } else {
      setState(() {
        _status = "Error connecting to backend!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter + Flask')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Backend Status: $_status'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkBackend,
              child: Text('Check Backend'),
            ),
          ],
        ),
      ),
    );
  }
}
