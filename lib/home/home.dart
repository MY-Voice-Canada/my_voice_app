import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../welcome/splashscreen.dart';

class MYVMHome extends StatefulWidget {
  @override
  _MYVMHomeState createState() => _MYVMHomeState();
}

class _MYVMHomeState extends State<MYVMHome> {
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
              MaterialPageRoute(builder: (context) => MYVMASplashScreen())),
          child: Text(
            "Email: ${Provider.of<MYVMProvider>(context).userEmail}, Password: ${Provider.of<MYVMProvider>(context).userPassword}",
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
