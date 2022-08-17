import 'package:flutter/material.dart';

AppBar getMVAppBar(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    elevation: 0,
    leading: IconButton(
      icon: Icon(Icons.search),
      onPressed: () => null,
    ),
    centerTitle: true,
    title: GestureDetector(
      onTap: () => Navigator.of(context).pushReplacementNamed("/home"),
      child: Center(
        child: Image.asset("./assets/images/logo.png", height: 50),
      ),
    ),
    backgroundColor: Theme.of(context).primaryColor,
    actions: [
      IconButton(
        icon: Icon(
          Icons.favorite,
          color: Colors.white,
        ),
        onPressed: () => null,
      ),
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
