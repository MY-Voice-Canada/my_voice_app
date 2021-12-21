import 'package:flutter/material.dart';

AppBar getMVAppBar(BuildContext context) {
  return AppBar(
    title: Row(
      children: [
        Image.asset(
          "assets/images/new_logo.png",
          height: 50,
        ),
        SizedBox(
          width: 10,
        ),
        Text("MY Voice Canada"),
      ],
    ),
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
          Icons.favorite,
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
