import 'package:flutter/material.dart';
import 'package:quiz_essay/biodata.dart';
import 'package:quiz_essay/hari.dart';
import 'package:quiz_essay/geometri.dart';

class Pages extends StatefulWidget {
  @override
  PagesState createState() => PagesState();
}

class PagesState extends State<Pages> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Biodata(),
    Geometri(),
    Hari(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.cyan.shade600,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Biodata',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Perhitungan Geometri',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_day),
            label: 'Konversi Hari',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
