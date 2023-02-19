import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:my_voice_app/main.dart';
import 'package:my_voice_app/models/category_text.dart';
import 'package:provider/provider.dart';

class PlaylistSubTab extends StatelessWidget {
  final Function notifyParent;
  final String? playlistName;
  final String cardColor;

  PlaylistSubTab(
      {required this.notifyParent, required this.cardColor, this.playlistName});

  @override
  Widget build(BuildContext context) {
    final videos = playlistName == null
        ? Provider.of<MVP>(context).channel!.videos!
        : Provider.of<MVP>(context).playlists![playlistName]!;

    return Card(
      margin: EdgeInsets.zero,
      color: HexColor(cardColor),
      elevation: 0,
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
                  // Container(
                  //   alignment: Alignment.bottomRight,
                  //   padding: EdgeInsets.only(left: 7),
                  //   child: Text(
                  //     'View All ',
                  //     style: TextStyle(
                  //       fontWeight: FontWeight.bold,
                  //       fontSize: 12,
                  //       color: HexColor('000000'),
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //   margin: EdgeInsets.only(bottom: 5),
                  //   child: Text(
                  //     ' >',
                  //     style: TextStyle(
                  //       fontSize: 23,
                  //       color: HexColor('FFA500'),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          SizedBox(
            height: playlistName == null
                ? Provider.of<MVP>(context).screenHeightAppbarless * 4 / 3.1
                : Provider.of<MVP>(context).screenHeightAppbarless * 2 / 3.1,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: playlistName == null ? 12 : 6,
              itemBuilder: (context, i) => GestureDetector(
                onTap: () {
                  Provider.of<MVP>(context, listen: false).watchView = true;
                  Provider.of<MVP>(context, listen: false).watchVideo =
                      videos[i];
                  notifyParent();
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 7),
                      child: SizedBox(
                        height:
                            Provider.of<MVP>(context).screenHeightAppbarless /
                                12,
                        width: Provider.of<MVP>(context).screenWidth / 5,
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
                      height:
                          Provider.of<MVP>(context).screenHeightAppbarless / 10,
                      width: Provider.of<MVP>(context).screenWidth / 1.3,
                      padding: EdgeInsets.fromLTRB(12, 13, 0, 0),
                      child: Text(
                        videos[i].title,
                        softWrap: false,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: Provider.of<MVP>(context).screenWidth > 625
                              ? 28.0
                              : 16.0,
                          color: HexColor('000000'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
