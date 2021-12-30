import 'package:flutter/material.dart';
import 'package:my_voice_app/home/home_widget.dart';
import 'package:my_voice_app/models/loading.dart';
import 'package:my_voice_app/services/auth.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import 'login_row.dart';

class MVSplashScreen extends StatefulWidget {
  @override
  _MVSplashScreenState createState() => _MVSplashScreenState();
}

class _MVSplashScreenState extends State<MVSplashScreen> {
  bool _isLoading = false;
  String _guestText = "Continue as Guest";

  @override
  Widget build(BuildContext context) {
    Provider.of<MVProvider>(context).screenHeightAppbarless =
        (MediaQuery.of(context).size.height -
            MediaQuery.of(context).padding.top);
    Provider.of<MVProvider>(context).screenWidth =
        MediaQuery.of(context).size.width;

    return _isLoading
        ? MVLoading()
        : Scaffold(
            body: Center(
                child: Container(
              height: Provider.of<MVProvider>(context).screenHeightAppbarless,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset("assets/images/new_logo.png"),
                  LoginRow(
                    signedIn: false,
                    registered: false,
                  ),
                  TextButton(
                      onPressed: () async {
                        setState(() {
                          _isLoading = true;
                        });
                        dynamic user = await MVAuth.signInAnon();
                        if (user == null) {
                          _isLoading = false;
                          setState(() {
                            _guestText =
                                "Guest mode could not work.\nPlease use one of the options above instead or refresh the app.";
                          });
                        } else
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => MVHome()));
                      },
                      child: FittedBox(
                        child: Text(
                          _guestText,
                          style: TextStyle(color: Colors.black, fontSize: 16.0),
                        ),
                        fit: BoxFit.fitWidth,
                      )),
                ],
              ),
            )),
          );
  }
}
