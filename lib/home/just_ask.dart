import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../welcome/splashscreen.dart';
import '../models/appbar.dart';

class JAPage extends StatefulWidget {
  final snapshot;

  JAPage({required this.snapshot});

  @override
  _JAPageState createState() => _JAPageState();
}

class _JAPageState extends State<JAPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
    );
  }
}
