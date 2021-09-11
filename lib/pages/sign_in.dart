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
                  fontSize: 48,
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
                      HexColor("FCB831").withOpacity(0.1),
                      HexColor("00B6B6").withOpacity(0.1),
                    ],
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          Center(
            child: SizedBox(
              height: Provider.of<MYVMProvider>(context).screenHeightAppbarless / 0.75,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SignInAndRegisterRow(signedIn: true, registered: false,),
                ]
              ),
            ),
          ),
        ],
      ),
    );
  }
}
