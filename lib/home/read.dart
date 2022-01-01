import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../welcome/splashscreen.dart';
import '../models/appbar.dart';

class ReadPage extends StatefulWidget {
  final snapshot;

  ReadPage({required this.snapshot});
  
  @override
  _ReadPageState createState() => _ReadPageState();
}

class _ReadPageState extends State<ReadPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}
