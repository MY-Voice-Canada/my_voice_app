import 'package:flutter/material.dart';

import 'package:my_voice_app/home.dart';

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
        child: Column(
          children: [
            Image.asset("assets/images/logo.png"),
            Row(
              children: [
                TextButton(
                  onPressed: _goToHomepage,
                  child: Text("Sign in"),
                ),
                Text(" | "),
                TextButton(
                  onPressed: _goToHomepage,
                  child: Text("Register"),
                ),
              ],
            ),
          ],
        )
      ),
    );
  }
}
