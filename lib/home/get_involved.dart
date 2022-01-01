import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../welcome/splashscreen.dart';
import '../models/appbar.dart';

class GIPage extends StatefulWidget {
  final snapshot;

  GIPage({required this.snapshot});

  @override
  _GIPageState createState() => _GIPageState();
}

class _GIPageState extends State<GIPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
    );
  }
}
