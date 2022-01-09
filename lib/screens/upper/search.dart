import 'package:flutter/material.dart';
import 'package:my_voice_app/models/background_image.dart';
import 'package:my_voice_app/screens/upper/appbar.dart';

class MVSearch extends StatefulWidget {
  @override
  _MVSearchState createState() => _MVSearchState();
}

class _MVSearchState extends State<MVSearch> {
  @override
  Widget build(BuildContext context) {
    return MVBackground(
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: getMVAppBar(context),
          body: Center(
            child: Text("Search"),
          ),
        ),
      ),
    );
  }
}
