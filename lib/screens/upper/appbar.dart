import 'package:flutter/material.dart';
import 'package:my_voice_app/screens/home/home_widget.dart';
import 'package:my_voice_app/screens/upper/favourites.dart';
import 'package:my_voice_app/screens/upper/search.dart';
import 'package:my_voice_app/screens/upper/settings.dart';

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
          Icons.search,
          color: Colors.white,
        ),
        onPressed: () => Navigator.of(context).pushReplacementNamed("/search"),
      ),
      IconButton(
        icon: Icon(
          Icons.favorite,
          color: Colors.white,
        ),
        onPressed: () => Navigator.of(context).pushReplacementNamed("/favs"),
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
