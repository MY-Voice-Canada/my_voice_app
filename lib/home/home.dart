import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../welcome/splashscreen.dart';

class MVHome extends StatefulWidget {
  @override
  _MVHomeState createState() => _MVHomeState();
}

class _MVHomeState extends State<MVHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MY Voice"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
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
    );
  }
}
