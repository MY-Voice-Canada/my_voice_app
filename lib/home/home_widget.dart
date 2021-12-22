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
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    this._pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onBottomNavChange(int i) {
    setState(() {
      this._currentIndex = i;

      _pageController.animateToPage(i,
          duration: Duration(milliseconds: 500), curve: Curves.easeOut);
      //print(this._currentIndex);
    });
  }

  Color? _selectedIcon(int i) {
    return this._currentIndex == i ? Colors.white : Colors.grey[800];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getMVAppBar(context),
      bottomNavigationBar: BottomNavigationBar(
        onTap: this._onBottomNavChange,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).primaryColor,
        //selectedLabelStyle: TextStyle(color: Colors.white),
        currentIndex: this._currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: _selectedIcon(0),
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.menu_book_rounded,
                color: _selectedIcon(1),
              ),
              label: "Read"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.ondemand_video_rounded,
                color: _selectedIcon(2),
              ),
              label: "Watch"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.textsms_rounded,
                color: _selectedIcon(3),
              ),
              label: "Ask"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle_outline,
                color: _selectedIcon(4),
              ),
              label: "Get Involved"),
        ],
      ),
      body: PageView(
        controller: this._pageController,
        onPageChanged: (i) {
          setState(() => this._currentIndex = i);
        },
        children: [
          HomePage(),
          ReadPage(),
          WatchPage(),
          GIPage(),
          JAPage(),
        ],
      ),
    );
  }
}
