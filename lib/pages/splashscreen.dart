import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import './sign_in.dart';
import './register.dart';

class MYVMASplashScreen extends StatefulWidget {
  @override
  _MYVMASplashScreenState createState() => _MYVMASplashScreenState();
}

class _MYVMASplashScreenState extends State<MYVMASplashScreen> {
  @override
  Widget build(BuildContext context) {
    Provider.of<MYVMProvider>(context).screenHeightAppbarless =
        (MediaQuery.of(context).size.height -
            MediaQuery.of(context).padding.top);

    return Scaffold(
      body: Center(
          child: Container(
        height: Provider.of<MYVMProvider>(context).screenHeightAppbarless,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset("assets/images/new_logo.png"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () => Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => MYVMASignIn())),
                  child: Text(
                    "Sign in",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize:
                          Provider.of<MYVMProvider>(context).buttonFontSize,
                    ),
                  ),
                ),
                Text(
                  " | ",
                  style: TextStyle(
                    fontSize: Provider.of<MYVMProvider>(context).buttonFontSize,
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => MYVMARegister())),
                  child: Text(
                    "Register",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize:
                          Provider.of<MYVMProvider>(context).buttonFontSize,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
