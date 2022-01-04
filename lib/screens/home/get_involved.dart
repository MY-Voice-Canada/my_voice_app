import 'package:flutter/material.dart';

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
