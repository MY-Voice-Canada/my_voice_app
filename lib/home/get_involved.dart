import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../welcome/splashscreen.dart';
import './appbar.dart';

class GIPage extends StatefulWidget {
  @override
  _GIPageState createState() => _GIPageState();
}

class _GIPageState extends State<GIPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getMVAppBar(context),
      /*bottomNavigationBar: BottomNavigationBar(
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
        ],),*/
      body: Container(
        color: Colors.red,
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
