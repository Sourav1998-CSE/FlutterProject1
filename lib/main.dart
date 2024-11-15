import 'package:flutter/material.dart';
import 'http_data_screen.dart';
import 'chopper_data_screen.dart';

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Networking Demo")),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HttpDataScreen()),
            ),
            child: Text("HTTP Package"),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChopperDataScreen()),
            ),
            child: Text("Chopper Package"),
          ),
        ],
      ),
    );
  }
}
