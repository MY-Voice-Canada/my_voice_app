import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import './splashscreen.dart';

class MYVMARegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MY Voice"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Text("Register"),
      ),
    );
  }
}
