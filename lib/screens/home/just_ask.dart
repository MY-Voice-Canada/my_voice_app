import 'package:flutter/material.dart';

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