import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:my_voice_app/main.dart';
import 'package:my_voice_app/models/category_text.dart';
import 'package:my_voice_app/models/loading.dart';
import 'package:my_voice_app/screens/home/category_subtab.dart';
import 'package:my_voice_app/screens/home/editorsPicksWidget.dart';
import 'package:provider/provider.dart';
import 'package:my_voice_app/screens/home/four_row_tiles.dart';
import 'package:responsive_framework/responsive_framework.dart';

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
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5.0,
              ),
              // MVCategoryText(
              //   Provider.of<MVP>(context).readCategory,
              //   version: MVCTVersion.pink,
              // ),
              SizedBox(
                height: 20.0,
              ),

              SizedBox(
                height: 20.0,
              ),
              Html(
                  style: {
                    "h1": Style(
                      fontSize: FontSize(22.0),
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
                    Row(
                      children: [
                        IconButton(
                          padding: EdgeInsets.all(5),
                          onPressed: null,
                          icon: Image(
                            image: AssetImage("assets/images/logo_icon.png"),
                          ),
                        ),
                        IconButton(
                          padding: EdgeInsets.all(5),
                          onPressed: null,
                          icon: Image(
                            image: AssetImage("assets/images/logo_icon.png"),
                          ),
                        ),
                      ],
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
                data: Provider.of<MVP>(context).readContent.toString(),
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
      );
    } else if (widget.snapshot.hasData) {
      return SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.0,
            ),
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
                        ]),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 5, 0, 15),
              margin: EdgeInsets.zero,
              color: HexColor('FFFFFF'),
              child: Divider(
                thickness: 5,
                indent: 0,
                endIndent: 260,
                color: HexColor('F5416C'),
              ),
            ),

            EditorsPicks(widget.snapshot.data.allPosts),

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
                data: widget.snapshot.data.cwPosts, cardColor: 'FFFFFF'), //test
            FourTileCategory(
                data: widget.snapshot.data.fthPosts, cardColor: 'D9D9D9'),
            FourTileCategory(
                data: widget.snapshot.data.fftPosts,
                cardColor: 'FFFFFF'), //test
            FourTileCategory(
                data: widget.snapshot.data.iiPosts, cardColor: 'D9D9D9'),
            FourTileCategory(
                data: widget.snapshot.data.laePosts,
                cardColor: 'FFFFFF'), //test

            Card(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      'Random',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 21,
                        color: HexColor('000000'),
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 4,
                    indent: 20,
                    endIndent: 250,
                    color: HexColor('F5416C'),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      'Title of the Big Article',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: HexColor('000000'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      'Category',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 14,
                        color: HexColor('F5416C'),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    height: 200,
                    width: 400,
                    child: Card(
                      child: Image.asset('assets/images/logo.png'),
                      margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Little Summary of Big Pic',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 13,
                        color: HexColor('000000'),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 20.0,
            ),
            CategorySubTab(
              notifyParent: () => setState(() {}),
              data: widget.snapshot.data.cwPosts,
            ),
            SizedBox(
              height: 20.0,
            ),
            CategorySubTab(
              notifyParent: () => setState(() {}),
              data: widget.snapshot.data.fthPosts,
            ),
            SizedBox(
              height: 20.0,
            ),
            CategorySubTab(
              notifyParent: () => setState(() {}),
              data: widget.snapshot.data.fftPosts,
            ),
            SizedBox(
              height: 20.0,
            ),
            CategorySubTab(
              notifyParent: () => setState(() {}),
              data: widget.snapshot.data.iiPosts,
            ),
            SizedBox(
              height: 20.0,
            ),
            CategorySubTab(
              notifyParent: () => setState(() {}),
              data: widget.snapshot.data.laePosts,
            ),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      );
    } else
      return MVLoading(
          message:
              "Don't forget to count your blessings while we're loading...");
  }
}
