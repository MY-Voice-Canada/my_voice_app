import 'package:flutter/material.dart';

void main() => runApp(MYVMApp());

class MYVMApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MY Voice App",
      theme: ThemeData(
        primaryColor: Colors.orange,
      ),
      home: MYVMAppHome(),
    );
  }
}

class MYVMAppHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MY Voice"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Text("..."),
      ),
    );
  }
}
