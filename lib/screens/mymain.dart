import 'package:basicflutter/screens/bar-manu/Document-page.dart';
import 'package:basicflutter/screens/bar-manu/Infor-page.dart';
import 'package:basicflutter/screens/bar-manu/Insight-page.dart';
import 'package:basicflutter/screens/bar-manu/Report-page.dart';
import 'package:flutter/material.dart';

class MyMain extends StatefulWidget {
  const MyMain({Key? key}) : super(key: key);

  @override
  State<MyMain> createState() => _MyMainState();
}

class _MyMainState extends State<MyMain> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    InsightPage(),
    DocumentPage(),
    ReprotPage(),
    InforPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Name Project'),
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Insight',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Document',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Report',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.delete),
            label: 'Infor',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
