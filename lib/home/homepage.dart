import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:my_voice_app/home/article_subtab.dart';
import 'package:my_voice_app/home/read.dart';
import 'package:my_voice_app/home/video_subtab.dart';
import 'package:my_voice_app/models/loading.dart';
import 'package:my_voice_app/models/user.dart';
import 'package:my_voice_app/services/wp.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../welcome/splashscreen.dart';
import '../models/appbar.dart';

class HomePage extends StatefulWidget {
  final Function changePage;
  final snapshot;

  HomePage({required this.snapshot, required this.changePage});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final MVUser user = Provider.of<MVUser?>(context)!;

    if (widget.snapshot.hasData) {
      return SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 10.0,
          ),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(children: [
              Image.asset(
                "assets/images/magazine_banner.png",
                height: 300.0,
                width: Provider.of<MVP>(context).screenWidth,
                fit: BoxFit.contain,
              )
            ]),
          ),
          SizedBox(
            height: 30.0,
          ),
          ArticleSubTab(
            data: widget.snapshot.data.allPosts,
            changePage: widget.changePage,
          ),
          SizedBox(height: 30.0),
          VideoSubTab(
            data: widget.snapshot.data.allPosts,
            changePage: widget.changePage,
          ),
          SizedBox(height: 660.0),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  height: 114.0,
                  color: Theme.of(context).primaryColor,
                  child: Center(
                    child: Text(
                      "Events",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 30),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Image.asset(
                  "assets/images/event_banner.png",
                  height: 114.0,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ]),
      );
    } else
      return MVLoading(message: "Count your blessings while we're loading...");
  }
}
