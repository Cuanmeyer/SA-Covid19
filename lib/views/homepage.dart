import 'package:flutter/material.dart';
import 'package:corona_south_africa_v1/views/south_africa_info.dart';

class HomePageMaster extends StatefulWidget {
  @override
  _HomePageMasterState createState() => _HomePageMasterState();
}

class _HomePageMasterState extends State<HomePageMaster> {
  int _currentIndex = 0;

  List<Widget> _widgets = <Widget> [
    SouthAfricaInfoPage(),
    //CountryListPage(),
    //PersonalInfoScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Theme.of(context).accentColor,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        items: <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            icon: Icon(Icons.public),
            title: Text('Global')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.list),
              title: Text('Countries')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.info),
              title: Text('About')
          ),
        ],
      ),
      body: _widgets.elementAt(_currentIndex),
    );
  }
}