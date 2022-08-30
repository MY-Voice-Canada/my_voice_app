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

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(
            thickness: 4.0,
            color: HexColor("FFBF3B"),
          ),
          SizedBox(
            height: 10.0,
            // child: OutlinedButton(
            //   onPressed: () {
            //     // Respond to button press
            //   },
            //   child: Text("View All >",
            //       style: TextStyle(
            //         color: Colors.black,
            //         fontSize: 11,
            //         fontWeight: FontWeight.bold,
            //       )),
            // )
          ),
          MVCategoryText(
            playlistName ?? "Miscellaneous",
            fontSize: 19,
            version: MVCTVersion.yellow,
          ),
          Container(
            alignment: Alignment.topRight,
            child: Text(
              'View All >',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.pink[300],
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
                childAspectRatio: 1.58,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 80.0,
                        height: 70.2,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(
                            videos[i].thumbnailUrl,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      ClipRect(
                        child: SizedBox(
                          height: 100.0,
                          width: 450.0,
                          child: videos[i].title.length > 60
                              ? Html(
                                  style: {
                                      "body": Style(
                                        margin: EdgeInsets.zero,
                                        padding: EdgeInsets.zero,
                                      )
                                    },
                                  data: "<h2>" +
                                      videos[i].title.substring(0, 60) +
                                      "..."
                                          "</h2>")
                              : Html(style: {
                                  "body": Style(
                                    margin: EdgeInsets.zero,
                                    padding: EdgeInsets.zero,
                                  )
                                }, data: "<h2>" + videos[i].title + "</h2>"),
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
