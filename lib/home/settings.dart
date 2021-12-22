import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../welcome/splashscreen.dart';
import './appbar.dart';

class MVSettings extends StatefulWidget {
  @override
  _MVSettingsState createState() => _MVSettingsState();
}

class _MVSettingsState extends State<MVSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getMVAppBar(context),
      body: Center(
        child: Text("Settings"),
      ),
    );
  }
}
