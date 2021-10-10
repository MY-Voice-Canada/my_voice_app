import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hexcolor/hexcolor.dart';

import '../main.dart';
import './splashscreen.dart';
import './login_row.dart';
import './sign_in_form.dart';

class MVASignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            top: Provider.of<MVProvider>(context).screenHeightAppbarless / 20,
            left: Provider.of<MVProvider>(context).screenWidth / 32,
            child: TextButton(
              onPressed: () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => MVASplashScreen())),
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
              maxWidth: Provider.of<MVProvider>(context).screenWidth * 2,
              child: Container(
                width: Provider.of<MVProvider>(context).screenWidth * 1.23,
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
              height:
                  Provider.of<MVProvider>(context).screenHeightAppbarless /
                      0.75,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LoginRow(signedIn: true, registered: false),
                    SizedBox(height: 20),
                    SIForm(),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
