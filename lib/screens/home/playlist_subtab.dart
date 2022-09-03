import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:my_voice_app/main.dart';
import 'package:my_voice_app/models/category_text.dart';
import 'package:provider/provider.dart';

class PlaylistSubTab extends StatelessWidget {
  final Function notifyParent;
  final String? playlistName;

  PlaylistSubTab({required this.notifyParent, this.playlistName});

  @override
  Widget build(BuildContext context) {
    final videos = playlistName == null
        ? Provider.of<MVP>(context).channel!.videos!
        : Provider.of<MVP>(context).playlists![playlistName]!;

    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: null,
            child: Container(
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.only(right: 18.0),
                    child: Text(playlistName ?? "Miscellaneous",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      'View All ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: HexColor('000000'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: Text(
                      ' >',
                      style: TextStyle(
                        fontSize: 23,
                        color: HexColor('FFA500'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          SizedBox(
            height: playlistName == null ? 1750.0 : 875.0,
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 360,
                childAspectRatio: 2.8,
                crossAxisSpacing: 7,
                mainAxisSpacing: 7,
              ),
              itemCount: playlistName == null ? 12 : 6,
              itemBuilder: (context, i) => GestureDetector(
                onTap: () {
                  Provider.of<MVP>(context, listen: false).watchView = true;
                  Provider.of<MVP>(context, listen: false).watchVideo =
                      videos[i];
                  notifyParent();
                },
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 7),
                        child: SizedBox(
                          height:
                              Provider.of<MVP>(context).screenHeightAppbarless /
                                  11,
                          width: Provider.of<MVP>(context).screenWidth / 3.9,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Container(
                              child: Image.network(
                                videos[i].thumbnailUrl,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: Provider.of<MVP>(context).screenWidth - 100,
                        child: ClipRect(
                          child: SizedBox(
                            height: Provider.of<MVP>(context)
                                    .screenHeightAppbarless /
                                10,
                            width: Provider.of<MVP>(context).screenWidth,
                            child: videos[i].title.length > 100
                                ? Html(
                                    style: {
                                        "body": Style(
                                          margin: EdgeInsets.only(left: 14),
                                          padding: EdgeInsets.zero,
                                        )
                                      },
                                    data: "<h4>" +
                                        videos[i].title.substring(0, 40) +
                                        "..."
                                            "</h4>")
                                : Html(style: {
                                    "body": Style(
                                      margin: EdgeInsets.only(left: 14),
                                      padding: EdgeInsets.zero,
                                    )
                                  }, data: "<h4>" + videos[i].title + "</h4>"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
