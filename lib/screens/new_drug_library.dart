import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 600,
        child: ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Item: $index'),
          tileColor: selectedIndex == index ? Colors.blue : null,
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
        );
      },
    ),
      ),
    );
    
  }
  }