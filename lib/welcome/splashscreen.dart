import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import 'login_row.dart';

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
    Provider.of<MYVMProvider>(context).screenWidth =
        MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
          child: Container(
        height: Provider.of<MYVMProvider>(context).screenHeightAppbarless,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset("assets/images/new_logo.png"),
            LoginRow(signedIn: false, registered: false,),
          ],
        ),
      )),
    );
  }
}
