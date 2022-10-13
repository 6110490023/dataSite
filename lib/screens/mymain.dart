import 'package:basicflutter/screens/bar-manu/Document-page.dart';
import 'package:basicflutter/screens/bar-manu/Infor-page.dart';
import 'package:basicflutter/screens/bar-manu/Insight-page.dart';
import 'package:basicflutter/screens/bar-manu/Report-page.dart';
import 'package:basicflutter/screens/list-project.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyMain extends StatefulWidget {
  const MyMain({Key? key}) : super(key: key);

  @override
  State<MyMain> createState() => _MyMainState();
}

class _MyMainState extends State<MyMain> {
  int _selectedIndex = 1;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String projectName = '';
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  
  static const List<Widget> _widgetOptions = <Widget>[
    ListProject(isFirst: false),
    InsightPage(),
    DocumentPage(),
    ReprotPage(),
    //InforPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  String getNamePage(){
    List<String> listPage= ['Project','Insight','Document','Report' ];
    return listPage[this._selectedIndex];
  }

  Future<Null> logout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }

  Future<Null> getProjectName() async {
    try {

      final SharedPreferences prefs = await _prefs;
      String _projectName = await prefs.getString('projectName') ?? "";
      setState(() {
        projectName = _projectName;
      });
    } catch (e) {}
  }

  @override
  void initState() {
    super.initState();
    getProjectName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Column(
            children: [
              Text(getNamePage() +" : " + projectName),
             
            ],
          ),
        ),
        actions: <Widget>[
          IconButton(onPressed: logout, icon: const Icon(Icons.login))
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insights),
            label: 'Insight',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.description_outlined),
            label: 'Document',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory_sharp),
            label: 'Report',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.info_outlined),
          //   label: 'Infor',
          // ),
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
