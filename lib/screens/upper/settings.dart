import 'package:flutter/material.dart';
import 'package:my_voice_app/main.dart';
import 'package:my_voice_app/models/background_image.dart';
import 'package:my_voice_app/models/loading.dart';
import 'package:my_voice_app/models/user.dart';
import 'package:my_voice_app/screens/upper/appbar.dart';
import 'package:my_voice_app/services/auth.dart';
import 'package:provider/provider.dart';

class MVSettings extends StatefulWidget {
  @override
  _MVSettingsState createState() => _MVSettingsState();
}

class _MVSettingsState extends State<MVSettings> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final MVUser? user = Provider.of<MVUser?>(context);

    return _isLoading
        ? MVLoading()
        : MVBackground(
            child: WillPopScope(
              onWillPop: () async => false,
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: getMVAppBar(context),
                body: Stack(
                  children: [
                    OverflowBox(
                      maxWidth: Provider.of<MVP>(context).screenWidth * 1.2,
                      child: Container(
                        width: Provider.of<MVP>(context).screenWidth * 1.1,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Hello, ${user?.displayName}",
                            style: TextStyle(
                              fontSize: 56.0,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          SizedBox(height: 100.0,),
                          Text("More settings will be added soon...", style: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),),
                          SizedBox(height: 150.0,),
                          TextButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Theme.of(context).primaryColor),
                            ),
                            onPressed: () async {
                              setState(() {
                                _isLoading = true;
                              });
                              await MVAuth.signOut();
                              setState(() {
                                _isLoading = false;
                              });
                              Navigator.of(context)
                                  .pushReplacementNamed("/splash");
                            },
                            child: Text(
                              "Sign out",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
