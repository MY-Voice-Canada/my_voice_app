import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class VideoSubTab extends StatelessWidget {
  final Function changePage;
  final data;

  VideoSubTab({required this.data, required this.changePage});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 7,
                  child: Image.asset(
                    "assets/images/video_banner.png",
                    height: 114.0,
                    fit: BoxFit.fill,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    height: 114.0,
                    color: HexColor("FCB831"),
                    child: Center(
                      child: Text(
                        "Videos",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 30),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 10.0,
              color: Colors.white,
            ),
            Text(
              "RECENT",
              style: TextStyle(color: Colors.grey),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 10.0),
            GestureDetector(
              onTap: () {
                Provider.of<MVP>(context, listen: false).watchView = true;
                Provider.of<MVP>(context, listen: false).watchVideo =
                    Provider.of<MVP>(context, listen: false).channel!.videos![0];
                changePage(2);
              },
              child: Column(
                children: [
                  Container(
                    child: Image.network(
                      Provider.of<MVP>(context)
                          .channel!
                          .videos![0]
                          .thumbnailUrl,
                      height: 250.0,
                      width: Provider.of<MVP>(context).screenWidth,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Html(
                      data: "<h1>" +
                          Provider.of<MVP>(context).channel!.videos![0].title +
                          "</h1>"),
                ],
              ),
            ),
            SizedBox(height: 25.0),
            Container(
              height: 300.0,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, i) => i != 0
                      ? GestureDetector(
                          onTap: () {
                            Provider.of<MVP>(context, listen: false).watchView =
                                true;
                            Provider.of<MVP>(context, listen: false)
                                    .watchVideo =
                                Provider.of<MVP>(context, listen: 
                                false).channel!.videos![i];

                            changePage(2);
                          },
                          child: SizedBox(
                            width: 250.0,
                            child: Card(
                              child: ListTile(
                                  title: SizedBox(
                                    width: 250.0,
                                    height: 150.0,
                                    child: Image.network(
                                        Provider.of<MVP>(context)
                                            .channel!
                                            .videos![i]
                                            .thumbnailUrl,
                                        fit: BoxFit.fill),
                                  ),
                                  subtitle: Provider.of<MVP>(context)
                                              .channel!
                                              .videos![i]
                                              .title
                                              .length >
                                          50
                                      ? Html(
                                          data: "<h2>" +
                                              Provider.of<MVP>(context)
                                                  .channel!
                                                  .videos![i]
                                                  .title
                                                  .substring(0, 47) +
                                              "..."
                                                  "</h2>")
                                      : Html(
                                          data: "<h2>" +
                                              Provider.of<MVP>(context)
                                                  .channel!
                                                  .videos![i]
                                                  .title +
                                              "</h2>")),
                            ),
                          ),
                        )
                      : SizedBox.shrink()),
            ),
          ],
        ));
  }
}
