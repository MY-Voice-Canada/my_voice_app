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
                    SizedBox(
                      height: 350,
                      width: 460,
                      child: Container(
                        color: Color.fromARGB(255, 187, 182, 182),
                        child: MVCategoryText(
                          playlistName ?? "Trending",
                          fontSize: 19,
                          version: MVCTVersion.transparent,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 0,
                    ),
                    PlaylistSubTab(
                      notifyParent: () => setState(() {}),
                      playlistName: "Race Against Racism",
                    ),
                    SizedBox(
                      height: 0,
                    ),
                    PlaylistSubTab(
                      notifyParent: () => setState(() {}),
                      playlistName: "Candid Convos",
                    ),
                    SizedBox(
                      height: 0,
                    ),
                    PlaylistSubTab(
                      notifyParent: () => setState(() {}),
                      playlistName: "The MY Voice Show",
                    ),
                    SizedBox(
                      height: 350,
                      width: 460,
                      child: Container(
                        color: Color.fromARGB(255, 187, 182, 182),
                        child: MVCategoryText(
                          playlistName ?? "For You",
                          fontSize: 19,
                          version: MVCTVersion.transparent,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 0,
                    ),
                    PlaylistSubTab(
                      notifyParent: () => setState(() {}),
                      playlistName: "Connecting The World",
                    ),
                    PlaylistSubTab(
                      notifyParent: () => setState(() {}),
                    ),
                    SizedBox(
                      height: 0,
                    ),
                    Container(
                        child: Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                          height: 42.0,
                          width: 308.0,
                          child: Container(
                              color: Color.fromARGB(255, 255, 236, 141),
                              child: new InkWell(
                                child: new Text(
                                    'Subscribe to our youtube channel (MY Voice Canada) for more content like this!',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.bold,
                                    )),
                                // ignore: deprecated_member_use
                                onTap: () => launch(
                                    'https://www.youtube.com/c/MYVoiceCanada'),
                              ))),
                    )),
                  ],
                ),
              );
  }
}
