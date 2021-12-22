import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../welcome/splashscreen.dart';
import './appbar.dart';

class MVFavs extends StatefulWidget {
  @override
  _MVFavsState createState() => _MVFavsState();
}

class _MVFavsState extends State<MVFavs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getMVAppBar(context),
      body: Center(
        child: Text("Favourites"),
      ),
    );
  }
}
