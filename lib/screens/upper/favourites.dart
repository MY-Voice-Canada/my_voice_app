import 'package:flutter/material.dart';
import 'package:my_voice_app/models/background_image.dart';
import 'package:my_voice_app/screens/upper/appbar.dart';

class MVFavs extends StatefulWidget {
  @override
  _MVFavsState createState() => _MVFavsState();
}

class _MVFavsState extends State<MVFavs> {
  @override
  Widget build(BuildContext context) {
    return MVBackground(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: getMVAppBar(context),
          body: Center(
            child: Text("Favourites"),
          ),
        ),
    );
  }
}
