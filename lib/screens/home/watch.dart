import 'package:auto_size_text/auto_size_text.dart';
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
import 'package:my_voice_app/utils/text.dart' as text_utils;

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
                    Card(
                      color: Colors.white,
                      elevation: 0,
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Container(
                        padding: EdgeInsets.only(left: 10.0),
                        alignment: Alignment.centerLeft,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage("assets/images/home_header.png"),
                              fit: BoxFit.fill),
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 24, 24, 0),
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "RobotoMono"),
                              children: [
                                TextSpan(
                                    text: "Trending",
                                    style: TextStyle(color: Colors.black)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height:
                          Provider.of<MVP>(context).screenHeightAppbarless / 53,
                      width: 115,
                      margin: EdgeInsets.only(left: 14, right: 292),
                      child: Divider(
                        thickness: 3.3,
                        color: HexColor("FFBF3B"),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Provider.of<MVP>(context, listen: false).watchView =
                            true;
                        Provider.of<MVP>(context, listen: false).watchVideo =
                            Provider.of<MVP>(context, listen: false)
                                .channel!
                                .videos![1];
                        setState(() {});
                      },
                      child: Column(
                        children: [
                          Container(
                            color: Colors.white,
                            padding:
                                EdgeInsets.only(left: 13, right: 12, top: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(
                                Provider.of<MVP>(context)
                                    .channel!
                                    .videos![1]
                                    .thumbnailUrl,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.only(left: 14, top: 5),
                              height: Provider.of<MVP>(context)
                                      .screenHeightAppbarless /
                                  37,
                              width: Provider.of<MVP>(context).screenWidth,
                              color: Colors.white,
                              child: Text('Miscellaneous',
                                  style: TextStyle(
                                    fontSize: 14.5,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange,
                                  ))),
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Container(
                        margin: EdgeInsets.only(left: 14, top: 5, bottom: 5),
                        child: Text(
                            Provider.of<MVP>(context).channel!.videos![1].title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.5,
                              color: Colors.black,
                            )),
                      ),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Provider.of<MVP>(context, listen: false).watchView =
                                true;
                            Provider.of<MVP>(context, listen: false)
                                    .watchVideo =
                                Provider.of<MVP>(context, listen: false)
                                    .channel!
                                    .videos![4];
                            setState(() {});
                          },
                          child: Column(
                            children: [
                              Container(
                                height: Provider.of<MVP>(context)
                                        .screenHeightAppbarless /
                                    8,
                                width:
                                    Provider.of<MVP>(context).screenWidth / 2,
                                padding: EdgeInsets.only(left: 13),
                                color: Colors.white,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.network(
                                    Provider.of<MVP>(context)
                                        .channel!
                                        .videos![4]
                                        .thumbnailUrl,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Container(
                                height: Provider.of<MVP>(context)
                                        .screenHeightAppbarless /
                                    30,
                                width:
                                    Provider.of<MVP>(context).screenWidth / 2,
                                padding: EdgeInsets.only(left: 14, top: 6),
                                color: Colors.white,
                                child: Text('Miscellaneous',
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.orange,
                                    )),
                              ),
                              Container(
                                height: Provider.of<MVP>(context)
                                        .screenHeightAppbarless /
                                    20,
                                width:
                                    Provider.of<MVP>(context).screenWidth / 2,
                                padding: EdgeInsets.only(left: 14),
                                color: Colors.white,
                                child: Text(
                                    Provider.of<MVP>(context)
                                        .channel!
                                        .videos![4]
                                        .title,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.black,
                                    )),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Provider.of<MVP>(context, listen: false).watchView =
                                true;
                            Provider.of<MVP>(context, listen: false)
                                    .watchVideo =
                                Provider.of<MVP>(context, listen: false)
                                    .channel!
                                    .videos![11];
                            setState(() {});
                          },
                          child: Column(
                            children: [
                              Container(
                                height: Provider.of<MVP>(context)
                                        .screenHeightAppbarless /
                                    8,
                                width:
                                    Provider.of<MVP>(context).screenWidth / 2,
                                padding: EdgeInsets.only(left: 13, right: 13),
                                color: Colors.white,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.network(
                                    Provider.of<MVP>(context)
                                        .channel!
                                        .videos![11]
                                        .thumbnailUrl,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Container(
                                height: Provider.of<MVP>(context)
                                        .screenHeightAppbarless /
                                    30,
                                width:
                                    Provider.of<MVP>(context).screenWidth / 2,
                                padding: EdgeInsets.only(left: 14, top: 6),
                                color: Colors.white,
                                child: Text('Miscellaneous',
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.orange,
                                    )),
                              ),
                              Container(
                                height: Provider.of<MVP>(context)
                                        .screenHeightAppbarless /
                                    20,
                                width:
                                    Provider.of<MVP>(context).screenWidth / 2,
                                padding: EdgeInsets.only(left: 14),
                                color: Colors.white,
                                child: Text(
                                    Provider.of<MVP>(context)
                                        .channel!
                                        .videos![11]
                                        .title,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.black,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height:
                          Provider.of<MVP>(context).screenHeightAppbarless / 27,
                      width: Provider.of<MVP>(context).screenWidth,
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
                      cardColor: 'FFFFFF',
                    ),
                    PlaylistSubTab(
                      notifyParent: () => setState(() {}),
                      playlistName: "The Hungry Muslim",
                      cardColor: 'D9D9D9',
                    ),
                    PlaylistSubTab(
                      notifyParent: () => setState(() {}),
                      playlistName: "The MY Voice Show",
                      cardColor: 'FFFFFF',
                    ),
                    GestureDetector(
                      onTap: () {
                        Provider.of<MVP>(context, listen: false).watchView =
                            true;
                        Provider.of<MVP>(context, listen: false).watchVideo =
                            Provider.of<MVP>(context, listen: false)
                                .channel!
                                .videos![0];
                        setState(() {});
                      },
                      child: Column(
                        children: [
                          Container(
                            height: Provider.of<MVP>(context)
                                    .screenHeightAppbarless /
                                15,
                            width: Provider.of<MVP>(context).screenWidth,
                            child: Container(
                              color: HexColor("D3D3D3"),
                              child: Column(
                                children: [
                                  Container(
                                    width:
                                        Provider.of<MVP>(context).screenWidth,
                                    padding: EdgeInsets.all(8),
                                    child: Text("For You",
                                        style: TextStyle(
                                          fontSize: 23,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: Provider.of<MVP>(context)
                                    .screenHeightAppbarless /
                                4.2,
                            width: Provider.of<MVP>(context).screenWidth,
                            color: HexColor("D3D3D3"),
                            child: SizedBox(
                              child: Container(
                                padding: EdgeInsets.only(left: 9, right: 9),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(6.0),
                                  child: Image.network(
                                    Provider.of<MVP>(context)
                                        .channel!
                                        .videos![0]
                                        .thumbnailUrl,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.only(left: 14, top: 5),
                              height: Provider.of<MVP>(context)
                                      .screenHeightAppbarless /
                                  37,
                              width: Provider.of<MVP>(context).screenWidth,
                              color: HexColor("D3D3D3"),
                              child: Text('Miscellaneous',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange,
                                  ))),
                          Container(
                            height: Provider.of<MVP>(context)
                                    .screenHeightAppbarless /
                                11,
                            width: Provider.of<MVP>(context).screenWidth,
                            color: HexColor("D3D3D3"),
                            child: SizedBox(
                              child: Container(
                                margin: EdgeInsets.only(
                                    left: 14, right: 14, top: 2),
                                child: Text(
                                    Provider.of<MVP>(context)
                                        .channel!
                                        .videos![0]
                                        .title,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.black,
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    PlaylistSubTab(
                      notifyParent: () => setState(() {}),
                      playlistName: "Connecting The World",
                      cardColor: 'FFFFFF',
                    ),
                    PlaylistSubTab(
                      notifyParent: () => setState(() {}),
                      playlistName: "Candid Convos",
                      cardColor: 'D9D9D9',
                    ),
                    PlaylistSubTab(
                      notifyParent: () => setState(() {}),
                      cardColor: 'FFFFFF',
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Image.asset("assets/images/open_mic.png"),
                            flex: 2),
                        Expanded(flex: 1, child: SizedBox()),
                        Expanded(
                          child: GestureDetector(
                            onTap: () async {
                              final url = Uri.parse(
                                  "https://www.youtube.com/c/MYVoiceCanada");
                              if (await canLaunchUrl(url)) await launchUrl(url);
                            },
                            child: ClipPath(
                              clipper: QuestionClipPath(),
                              child: Container(
                                color: HexColor("FFBF3B"),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 10, top: 15, bottom: 15, left: 60),
                                  child: AutoSizeText(
                                    "Click here to subscribe to our YouTube channel, MY Voice Canada!",
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontFamily: 'Raleway',
                                        fontWeight: FontWeight.bold,
                                        fontSize: text_utils
                                            .getadaptiveTextSize(context, 20),
                                        color: Color.fromRGBO(0, 0, 0, 1)),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          flex: 6,
                        ),
                      ],
                    )
                  ],
                ),
              );
  }
}
