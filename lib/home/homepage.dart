import 'package:flutter/material.dart';
import 'package:my_voice_app/models/user.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../welcome/splashscreen.dart';
import './appbar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final MVUser? user = Provider.of<MVUser?>(context);

    if (user != null)
      return Text(user.uid, style: TextStyle(fontSize: 48));
    else
      return Text("hi");
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
