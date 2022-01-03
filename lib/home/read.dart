import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:my_voice_app/models/loading.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../welcome/splashscreen.dart';
import '../models/appbar.dart';

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
            children: [
              Container(
                child: Image.network(
                  Provider.of<MVP>(context).readImage,
                  height: 250.0,
                  width: Provider.of<MVP>(context).screenWidth,
                  fit: BoxFit.fill,
                ),
              ),
              Html(
                  data: "<h1>" +
                      Provider.of<MVP>(context).readTitle.toString() +
                      "</h1>"),
              Html(data: Provider.of<MVP>(context).readContent.toString()),
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
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                          text: "\nYouth-crafted Articles",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 36)),
                    ]),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.snapshot.data.allPosts.length,
              itemBuilder: (context, i) => i != 0
                  ? GestureDetector(
                      onTap: () {
                        Provider.of<MVP>(context, listen: false).readView =
                            true;
                        Provider.of<MVP>(context, listen: false).readImage =
                            widget.snapshot.data.allPosts[i]["_embedded"]
                                ["wp:featuredmedia"][0]["source_url"];
                        Provider.of<MVP>(context, listen: false).readTitle =
                            widget.snapshot.data.allPosts[i]["title"]["rendered"];
                        Provider.of<MVP>(context, listen: false).readContent =
                            widget.snapshot.data.allPosts[i]["content"]["rendered"];
                        setState(() {});
                      },
                      child: Card(
                        child: ListTile(
                            leading: SizedBox(
                              width: 150.0,
                              child: Image.network(
                                  widget.snapshot.data.allPosts[i]["_embedded"]
                                      ["wp:featuredmedia"][0]["source_url"],
                                  fit: BoxFit.fill),
                            ),
                            title: Html(
                                data: "<h2>" +
                                    widget.snapshot.data
                                        .allPosts[i]["title"]["rendered"]
                                        .toString() +
                                    "</h2>"),
                            subtitle: Html(
                                data: widget
                                        .snapshot.data
                                        .allPosts[i]["content"]["rendered"]
                                        .toString()
                                        .replaceAll("\n", "")
                                        .replaceAll("<p>", "")
                                        .replaceAll("</p>", "")
                                        .replaceAll("&nbsp;", "")
                                        .substring(0, 100) +
                                    "...")),
                      ),
                    )
                  : SizedBox.shrink()),
        ),
      ]);
    } else
      return MVLoading();
  }
}
