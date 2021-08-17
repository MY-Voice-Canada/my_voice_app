import 'package:flutter/material.dart';

import 'package:my_voice_app/home.dart';

class MYVMASplashScreen extends StatefulWidget {
  @override
  _MYVMASplashScreenState createState() => _MYVMASplashScreenState();
}

class _MYVMASplashScreenState extends State<MYVMASplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(milliseconds: 1500), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MYVMAHome()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset("assets/images/logo.png")),
    );
  }
}
