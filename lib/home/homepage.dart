import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../welcome/splashscreen.dart';
import './appbar.dart';

class MVHome extends StatefulWidget {
  @override
  _MVHomeState createState() => _MVHomeState();
}

class _MVHomeState extends State<MVHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getMVAppBar(context),
      bottomNavigationBar: BottomNavigationBar(
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
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (BuildContext context, int i) => Text(
          "${i + 1}",
          style: TextStyle(fontSize: 48),
        ),
      ),
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
