import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hexcolor/hexcolor.dart';

import '../main.dart';
import './splashscreen.dart';

class MYVMASignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: Provider.of<MYVMProvider>(context).screenHeightAppbarless / 20,
            left: Provider.of<MYVMProvider>(context).screenWidth / 32,
            child: TextButton(
              onPressed: () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => MYVMASplashScreen())),
              child: Text(
                "<",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 72,
                ),
              ),
            ),
          ),
          Center(
            child: OverflowBox(
              maxWidth: Provider.of<MYVMProvider>(context).screenWidth * 2,
              child: Container(
                width: Provider.of<MYVMProvider>(context).screenWidth * 1.23,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      
                    ],
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
