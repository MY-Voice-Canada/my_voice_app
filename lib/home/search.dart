import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../welcome/splashscreen.dart';
import './appbar.dart';

class MVSearch extends StatefulWidget {
  @override
  _MVSearchState createState() => _MVSearchState();
}

class _MVSearchState extends State<MVSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getMVAppBar(context),
      body: Center(
        child: Text("Search"),
      ),
    );
  }
}
