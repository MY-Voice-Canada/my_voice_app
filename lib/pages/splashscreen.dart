import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import './home.dart';

class MYVMASplashScreen extends StatefulWidget {
  @override
  _MYVMASplashScreenState createState() => _MYVMASplashScreenState();
}

class _MYVMASplashScreenState extends State<MYVMASplashScreen> {
  void _goToHomepage() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MYVMAHome()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            children: [
              Image.asset("assets/images/new_logo.png"),
              Row(
                children: [
                  TextButton(
                    onPressed: _goToHomepage,
                    child: Text("Sign in"),
                  ),
                  Text(Provider.of<MYVMProvider>(context).screenHeightAppbarless.toString()),
                  TextButton(
                    onPressed: _goToHomepage,
                    child: Text("Register"),
                  ),
                ],
              ),
            ],
          ),
        )
      ),
    );
  }
}
