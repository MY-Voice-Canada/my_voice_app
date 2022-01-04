import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:my_voice_app/models/category_text.dart';
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
            "TRENDING",
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Image.network(
                    Provider.of<MVP>(context).channel!.videos![0].thumbnailUrl,
                    height: 250.0,
                    width: Provider.of<MVP>(context).screenWidth,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                MVCategoryText("Latest", yellowVersion: true),
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
              itemCount: 4,
              itemBuilder: (context, i) {
                print(Provider.of<MVP>(context)
                    .playlists!["Race Against Racism"]!);

                String playlistName = "";
                switch (i) {
                  case 0:
                    playlistName = "Race Against Racism";
                    break;
                  case 1:
                    playlistName = "Candid Convos";
                    break;
                  case 2:
                    playlistName = "The MY Voice Show";
                    break;
                  case 3:
                    playlistName = "Connecting The World";
                    break;
                }

                return GestureDetector(
                  onTap: () {
                    Provider.of<MVP>(context, listen: false).watchView = true;
                    Provider.of<MVP>(context, listen: false).watchVideo =
                        Provider.of<MVP>(context, listen: false)
                            .playlists![playlistName]![i];
                    changePage(2);
                  },
                  child: SizedBox(
                    width: 250.0,
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 250.0,
                            height: 150.0,
                            child: Image.network(
                                Provider.of<MVP>(context)
                                    .playlists![playlistName]![i]
                                    .thumbnailUrl,
                                fit: BoxFit.fill),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          MVCategoryText(playlistName, yellowVersion: true),
                          ClipRect(
                            child: SizedBox(
                              height: 100.0,
                              child: Provider.of<MVP>(context)
                                          .playlists![playlistName]![i]
                                          .title
                                          .length >
                                      55
                                  ? Html(style: {
                                              "h2": Style(
                                                margin: EdgeInsets.zero,
                                                padding: EdgeInsets.zero,
                                              )
                                            },
                                      data: "<h2>" +
                                          Provider.of<MVP>(context)
                                              .playlists![playlistName]![i]
                                              .title
                                              .substring(0, 52) +
                                          "..."
                                              "</h2>")
                                  : Html(style: {
                                              "h2": Style(
                                                margin: EdgeInsets.zero,
                                                padding: EdgeInsets.zero,
                                              )
                                            },
                                      data: "<h2>" +
                                          Provider.of<MVP>(context)
                                              .playlists![playlistName]![i]
                                              .title +
                                          "</h2>"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
