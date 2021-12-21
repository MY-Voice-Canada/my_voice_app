import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../welcome/splashscreen.dart';
import './appbar.dart';
import './homepage.dart';
import './read.dart';
import './watch.dart';
import './just_ask.dart';
import './get_involved.dart';

class MVHome extends StatefulWidget {
  @override
  _MVHomeState createState() => _MVHomeState();
}

class _MVHomeState extends State<MVHome> {
  int _currentIndex = 0;
  final List _children = [
    HomePage(),
    ReadPage(),
    WatchPage(),
    GIPage(),
    JAPage(),
  ];

  void _onBottomNavChange(int i) {
    setState(() {
      this._currentIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getMVAppBar(context),
      bottomNavigationBar: BottomNavigationBar(
        onTap: this._onBottomNavChange,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).primaryColor,
        selectedLabelStyle: TextStyle(
          color: Colors.white,
        ),
        /*unselectedLabelStyle: TextStyle(
          color: Colors.white,
        ),*/
        selectedItemColor: Colors.white,
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_rounded), label: "Read"),
          BottomNavigationBarItem(
              icon: Icon(Icons.ondemand_video_rounded), label: "Watch"),
          BottomNavigationBarItem(
              icon: Icon(Icons.textsms_rounded), label: "Ask"),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline), label: "Get Involved"),
        ],
      ),
      body: _children[_currentIndex],
    );
    /*SingleChildScrollView(
        child: TextButton(
          onPressed: () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => MVASplashScreen())),
          child: Text(
            "Email: ${Provider.of<MVProvider>(context).userEmail}, Password: ${Provider.of<MVProvider>(context).userPassword}",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 48,
            ),
          ),
        ),
      ),
    );*/
  }
}
