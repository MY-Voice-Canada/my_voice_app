import 'package:flutter/material.dart';

AppBar getMVAppBar(BuildContext context) {
  return AppBar(
    title: Text("MY Voice"),
    backgroundColor: Theme.of(context).primaryColor,
    actions: [
      IconButton(
        icon: Icon(
          Icons.search,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
      IconButton(
        icon: Icon(
          Icons.favorite_border,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
      IconButton(
        icon: Icon(
          Icons.settings,
          color: Colors.white,
        ),
        onPressed: () {},
      )
    ],
  );
}