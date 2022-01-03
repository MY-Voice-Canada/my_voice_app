import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:my_voice_app/models/category_text.dart';
import 'package:my_voice_app/models/loading.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../welcome/splashscreen.dart';
import '../models/appbar.dart';
import 'category_subtab.dart';

class ReadPage extends StatefulWidget {
  final snapshot;

  ReadPage({required this.snapshot});

  @override
  _ReadPageState createState() => _ReadPageState();
}

class _ReadPageState extends State<ReadPage> {
  @override
  Widget build(BuildContext context) {
    if (Provider.of<MVP>(context).readView) {
      return SingleChildScrollView(
        child: Card(
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  Provider.of<MVP>(context).readImage,
                  height: 250.0,
                  width: Provider.of<MVP>(context).screenWidth,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              MVCategoryText(Provider.of<MVP>(context).readCategory),
              Html(
                  style: {
                    "h1": Style(fontSize: FontSize(56.0)),
                  },
                  data: "<h1>" +
                      Provider.of<MVP>(context).readTitle.toString() +
                      "</h1>"),
              Html(
                style: {
                  "body": Style(fontSize: FontSize(20.0)),
                },
                data: Provider.of<MVP>(context).readContent.toString(),
              ),
              SizedBox(height: 100.0),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      Provider.of<MVP>(context, listen: false).readView = false;
                    });
                  },
                  child: Text("Go Back")),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      );
    } else if (widget.snapshot.hasData) {
      return SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.0,
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                padding: EdgeInsets.only(left: 10.0),
                alignment: Alignment.centerLeft,
                width: double.infinity,
                height: 240.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/home_header.png"),
                      fit: BoxFit.fill),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.0),
                  child: RichText(
                    text: TextSpan(
                        style: TextStyle(
                            fontSize: 56,
                            fontWeight: FontWeight.bold,
                            fontFamily: "RobotoMono"),
                        children: [
                          TextSpan(
                              text: "Read Our",
                              style: TextStyle(color: Colors.black)),
                          TextSpan(
                              text: "\nYouth-made Articles",
                              style: TextStyle(
                                  color: Theme.of(context).secondaryHeaderColor,
                                  fontSize: 36)),
                        ]),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            CategorySubTab(
              notifyParent: () => setState(() {}),
              data: widget.snapshot.data.cwPosts,
            ),
            CategorySubTab(
              notifyParent: () => setState(() {}),
              data: widget.snapshot.data.fthPosts,
            ),
            CategorySubTab(
              notifyParent: () => setState(() {}),
              data: widget.snapshot.data.fftPosts,
            ),
            CategorySubTab(
              notifyParent: () => setState(() {}),
              data: widget.snapshot.data.iiPosts,
            ),
            CategorySubTab(
              notifyParent: () => setState(() {}),
              data: widget.snapshot.data.laePosts,
            ),
          ],
        ),
      );
    } else
      return MVLoading(message: "Count your blessings while we're loading...");
  }
}
