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
    return Container(
      color: Colors.amber,
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