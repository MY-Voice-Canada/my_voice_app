import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:my_voice_app/main.dart';
import 'package:my_voice_app/models/loading.dart';
import 'package:my_voice_app/screens/home/editorsPicksWidget.dart';
import 'package:my_voice_app/screens/home/random_article.dart';
import 'package:provider/provider.dart';
import 'package:my_voice_app/screens/home/four_row_tiles.dart';

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
          margin: EdgeInsets.zero,
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // MVCategoryText(
                //   Provider.of<MVP>(context).readCategory,
                //   version: MVCTVersion.pink,
                // ),

                SizedBox(
                  height: 20.0,
                ),
                Html(
                    style: {
                      "h1": Style(
                        fontSize: FontSize(24.0),
                        margin: EdgeInsets.zero,
                      ),
                    },
                    data: "<h1>" +
                        Provider.of<MVP>(context).readTitle.toString() +
                        "</h1>"),
                Container(
                  margin: EdgeInsets.zero,
                  color: HexColor('FFFFFF'),
                  child: Divider(
                    thickness: 3,
                    indent: 10,
                    endIndent: 240,
                    color: HexColor('F5416C'),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: Theme.of(context).secondaryHeaderColor,
                              fontSize: 18.0,
                            ),
                            children: [
                              TextSpan(
                                text: Provider.of<MVP>(context)
                                        .readAuthor
                                        .toString()
                                        .toUpperCase() +
                                    " " * 2,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: HexColor('F5416C'),
                                ),
                              ),
                              TextSpan(
                                  text: ' |  ',
                                  style: TextStyle(color: HexColor('000000'))),
                              TextSpan(
                                text: DateFormat("MMMM d, y")
                                    .format(Provider.of<MVP>(context).readDate!)
                                    .toUpperCase(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: HexColor('F5416C'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  padding: EdgeInsets.all(1),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      Provider.of<MVP>(context).readImage,
                      height: 250.0,
                      width: Provider.of<MVP>(context).screenWidth,
                      fit: BoxFit.fill,
                    ),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Html(
                  style: {
                    "body": Style(
                      fontSize: FontSize(20.0),
                      textAlign: TextAlign.start,
                    )
                  },
                  data: Provider.of<MVP>(context).readContent,
                ),
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
                      onPressed: () {
                        setState(() {
                          Provider.of<MVP>(context, listen: false).readView =
                              false;
                        });
                      },
                      child: Text(
                        "Read Something Else",
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      )),
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      );
    } else if (widget.snapshot.hasData) {
      return SingleChildScrollView(
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
                      image: AssetImage("assets/images/home_header.png"),
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
                            text: "Editor's Picks",
                            style: TextStyle(color: Colors.black)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 15),
              margin: EdgeInsets.zero,
              width: 230,
              color: HexColor('FFFFFF'),
              child: Divider(
                thickness: 5,
                indent: 10,
                endIndent: 10,
                color: HexColor('F5416C'),
              ),
            ),

            EditorsPicks(
              data: widget.snapshot.data.allPosts,
              notifyParent: () => setState(() {}),
            ),

            Container(
              margin: EdgeInsets.zero,
              color: HexColor('FFFFFF'),
              child: Divider(
                thickness: 5,
                indent: 20,
                endIndent: 20,
                color: HexColor('F5416C'),
              ),
            ),

            FourTileCategory(
              data: widget.snapshot.data.cwPosts,
              cardColor: 'FFFFFF',
              notifyParent: () => setState(() {}),
            ), //test
            FourTileCategory(
              data: widget.snapshot.data.fthPosts,
              cardColor: 'D9D9D9',
              notifyParent: () => setState(() {}),
            ),
            FourTileCategory(
              data: widget.snapshot.data.fftPosts,
              cardColor: 'FFFFFF',
              notifyParent: () => setState(() {}),
            ), //test
            FourTileCategory(
              data: widget.snapshot.data.iiPosts,
              cardColor: 'D9D9D9',
              notifyParent: () => setState(() {}),
            ),
            FourTileCategory(
              data: widget.snapshot.data.laePosts,
              cardColor: 'FFFFFF',
              notifyParent: () => setState(() {}),
            ), //test

            RandomArticle(
              data: widget.snapshot.data.allPosts,
              notifyParent: () => setState(() {}),
            ),

            // SizedBox(
            //   height: 20.0,
            // ),
            // CategorySubTab(
            //   notifyParent: () => setState(() {}),
            //   data: widget.snapshot.data.cwPosts,
            // ),
            // SizedBox(
            //   height: 20.0,
            // ),
            // CategorySubTab(
            //   notifyParent: () => setState(() {}),
            //   data: widget.snapshot.data.fthPosts,
            // ),
            // SizedBox(
            //   height: 20.0,
            // ),
            // CategorySubTab(
            //   notifyParent: () => setState(() {}),
            //   data: widget.snapshot.data.fftPosts,
            // ),
            // SizedBox(
            //   height: 20.0,
            // ),
            // CategorySubTab(
            //   notifyParent: () => setState(() {}),
            //   data: widget.snapshot.data.iiPosts,
            // ),
            // SizedBox(
            //   height: 20.0,
            // ),
            // CategorySubTab(
            //   notifyParent: () => setState(() {}),
            //   data: widget.snapshot.data.laePosts,
            // ),
            // SizedBox(
            //   height: 20.0,
            // ),
          ],
        ),
      );
    } else
      return MVLoading(
          message: "Uh oh, something's gone wrong! Please restart the app...");
  }
}
