import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:my_voice_app/models/loading.dart';
import 'package:my_voice_app/models/user.dart';
import 'package:my_voice_app/services/wp.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../welcome/splashscreen.dart';
import '../models/appbar.dart';

class HomePage extends StatefulWidget {
  final snapshot;

  HomePage({required this.snapshot});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final MVUser user = Provider.of<MVUser?>(context)!;

    if (widget.snapshot.hasData) {
      return widget.snapshot.data?.length == 0
          ? Center(child: Text("No posts available at the moment."))
          : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 10.0,
              ),
              RichText(
                text: TextSpan(
                    style: TextStyle(
                        fontSize: 72,
                        fontWeight: FontWeight.bold,
                        fontFamily: "RobotoMono"),
                    children: [
                      TextSpan(
                          text: "Welcome,",
                          style: TextStyle(color: Colors.black)),
                      TextSpan(
                          text: "\n${user.displayName}",
                          style:
                              TextStyle(color: Theme.of(context).primaryColor)),
                    ]),
              ),
              SizedBox(
                height: 20.0,
              ),
              Divider(
                color: Colors.black,
                height: 1.0,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      height: 114.0,
                      color: HexColor("FF3E62"),
                      child: Center(
                        child: Text(
                          "Read\nArticles",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 24),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Image.asset(
                      "assets/images/article_banner.png",
                      height: 114.0,
                    ),
                  ),
                ],
              ),
              Container(
                height: 750.0,
                child: ListView.builder(
                  itemCount: widget.snapshot.data?.length,
                  itemBuilder: (context, i) => Card(
                    child: ListTile(
                      leading: Image.network(widget.snapshot.data![i]
                          ["_embedded"]["wp:featuredmedia"][0]["source_url"]),
                      title: Html(
                          data: "<h2>" +
                              widget.snapshot.data![i]["title"]["rendered"]
                                  .toString() +
                              "</h2>"),
                      subtitle: Html(
                          data: widget.snapshot.data![i]["content"]["rendered"]
                                  .toString()
                                  .replaceAll("\n", "")
                                  .replaceAll("<p>", "")
                                  .replaceAll("</p>", "")
                                  .replaceAll("&nbsp;", "")
                                  .substring(0, 100) +
                              "..."),
                    ),
                  ),
                ),
              ),
            ]);
    } else
      return MVLoading();
  }
}
