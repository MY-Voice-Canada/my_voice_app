import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../welcome/splashscreen.dart';
import './appbar.dart';

class ReadPage extends StatefulWidget {
  @override
  _ReadPageState createState() => _ReadPageState();
}

class _ReadPageState extends State<ReadPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
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
