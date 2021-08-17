import 'package:flutter/material.dart';

import './splashscreen.dart';
import './home.dart';

void main() => runApp(MYVMApp());

class MYVMApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MY Voice App",
      theme: ThemeData(
        primaryColor: Colors.orange,
      ),
      home: MYVMASplashScreen(),
    );
  }
}