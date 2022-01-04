import 'package:flutter/material.dart';
import 'package:my_voice_app/models/background_image.dart';
import 'package:my_voice_app/models/loading.dart';
import 'package:my_voice_app/screens/upper/appbar.dart';
import 'package:my_voice_app/screens/welcome/splashscreen.dart';
import 'package:my_voice_app/services/auth.dart';

class MVSettings extends StatefulWidget {
  @override
  _MVSettingsState createState() => _MVSettingsState();
}

class _MVSettingsState extends State<MVSettings> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? MVLoading()
        : MVBackground(
          child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: getMVAppBar(context),
              body: Center(
                  child: TextButton(
                      onPressed: () async {
                        setState(() {
                          _isLoading = true;
                        });
                        await MVAuth.signOut();
                        setState(() {
                          _isLoading = false;
                        });
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => MVSplashScreen()));
                        //Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => MVSettings())),
                      },
                      child: Text("Sign Out?")))),
        );
  }
}
