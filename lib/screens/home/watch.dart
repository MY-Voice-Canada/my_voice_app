import 'package:flutter/gestures.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:flutter/material.dart';
import 'package:my_voice_app/models/category_text.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:my_voice_app/main.dart';
import 'package:my_voice_app/models/background_image.dart';
import 'package:my_voice_app/models/channel.dart';
import 'package:my_voice_app/models/loading.dart';
import 'package:my_voice_app/screens/home/playlist_subtab.dart';
import 'package:my_voice_app/screens/home/theatre.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class QuestionClipPath extends CustomClipper<Path> {
  Path getClip(Size size) {
    return Path()
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width * 0.25, size.height);
  }

  @override
  bool shouldReclip(CustomClipper<Path> path) => false;
}

class WatchPage extends StatefulWidget {
  @override
  _WatchPageState createState() => _WatchPageState();
}

class _WatchPageState extends State<WatchPage> {
  var playlistName;

  @override
  Widget build(BuildContext context) {
    Channel? channel = Provider.of<MVP>(context).channel;
    return channel == null
        ? MVLoading(
            message:
                "Don't forget to count your blessings while we're loading...",
          )
        : Provider.of<MVP>(context).watchView
            ? MVBackground(
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MVTheatre(video: Provider.of<MVP>(context).watchVideo!),
                      SizedBox(height: 50.0),
                      Center(
                        child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all(
                                  Theme.of(context).secondaryHeaderColor),
                              overlayColor:
                                  MaterialStateProperty.all(HexColor("FFBF3B")),
                            ),
                            onPressed: () => setState(
                                  () {
                                    Provider.of<MVP>(context, listen: false)
                                        .watchView = false;
                                  },
                                ),
                            child: Text(
                              "Watch Something Else",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            )),
                      ),
                      SizedBox(height: 20.0),
                    ],
                  ),
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: GestureDetector(
                        onTap: null,
                        child: Container(
                          color: Colors.white,
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(8),
                                margin: EdgeInsets.only(right: 18.0),
                                child: Text("Trending",
                                    style: TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                              Container(
                                alignment: Alignment.bottomRight,
                                padding: EdgeInsets.only(left: 150),
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
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 15.0, left: 15.0),
                      color: Colors.white,
                      child: Divider(
                        thickness: 5.0,
                        color: HexColor("FFBF3B"),
                      ),
                    ),
                    PlaylistSubTab(
                      notifyParent: () => setState(() {}),
                      playlistName: "Race Against Racism",
                    ),
                    PlaylistSubTab(
                      notifyParent: () => setState(() {}),
                      playlistName: "Candid Convos",
                    ),
                    PlaylistSubTab(
                      notifyParent: () => setState(() {}),
                      playlistName: "The MY Voice Show",
                    ),
                    Container(
                      child: GestureDetector(
                        onTap: null,
                        child: Container(
                          color: Colors.white,
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(8),
                                margin: EdgeInsets.only(right: 183),
                                child: Text("For You",
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
                    ),
                    PlaylistSubTab(
                      notifyParent: () => setState(() {}),
                      playlistName: "Connecting The World",
                    ),
                    PlaylistSubTab(
                      notifyParent: () => setState(() {}),
                    ),
                    SizedBox(
                      height:
                          Provider.of<MVP>(context).screenHeightAppbarless / 11,
                      width: Provider.of<MVP>(context).screenWidth,
                      child: Container(
                        color: Color.fromARGB(255, 255, 255, 255),
                        child: ClipPath(
                            clipper: QuestionClipPath(),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: SizedBox(
                                  height: 50.5,
                                  width: 350,
                                  child: Container(
                                      color: Color.fromARGB(255, 255, 236, 141),
                                      padding: EdgeInsets.all(8),
                                      child: new InkWell(
                                        child: new Text(
                                            'Subscribe to our youtube channel (MY Voice Canada) for more content like this!',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            )),
                                        // ignore: deprecated_member_use
                                        onTap: () => launch(
                                            'https://www.youtube.com/c/MYVoiceCanada'),
                                      ))),
                            )),
                      ),
                    ),
                  ],
                ),
              );
  }
}
