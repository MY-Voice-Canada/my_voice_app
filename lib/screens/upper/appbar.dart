import 'package:flutter/material.dart';

AppBar getMVAppBar(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    title: GestureDetector(
      onTap: () => Navigator.of(context).pushReplacementNamed("/home"),
      child: Row(
        children: [
          Image.asset("./assets/images/logo.png", height: 50),
          SizedBox(width: 10),
          Text("MY Voice Canada"),
        ],
      ),
    ),
    backgroundColor: Theme.of(context).primaryColor,
    actions: [
      IconButton(
        icon: Icon(
          Icons.settings,
          color: Colors.white,
        ),
        onPressed: () =>
            Navigator.of(context).pushReplacementNamed("/settings"),
      ),
    ],
  );
}
