import 'package:auto_size_text/auto_size_text.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:my_voice_app/main.dart';
import 'package:my_voice_app/models/category_text.dart';
import 'package:my_voice_app/models/loading.dart';
import 'package:my_voice_app/models/user.dart';
import 'package:my_voice_app/screens/home/category_subtab.dart';
import 'package:my_voice_app/screens/home/editorsPicksWidget.dart';
import 'package:my_voice_app/screens/home/four_row_tiles.dart';
import 'package:my_voice_app/screens/home/homepage.dart';
import 'package:my_voice_app/services/db.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:my_voice_app/utils/text.dart' as text_utils;

class JAPage extends StatefulWidget {
  final snapshot;

  JAPage({required this.snapshot});

  @override
  _JAPageState createState() => _JAPageState();
}

class _JAPageState extends State<JAPage> {
  @override
  Widget build(BuildContext context) {
    MVUser user = Provider.of<MVUser?>(context)!;

    if (Provider.of<MVP>(context).jaView) {
      return SingleChildScrollView(
        child: Card(
          margin: EdgeInsets.zero,
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                        Provider.of<MVP>(context).jaTitle.toString() +
                        "</h1>"),
                Container(
                  margin: EdgeInsets.zero,
                  color: HexColor('FFFFFF'),
                  child: Divider(
                    thickness: 3,
                    indent: 10,
                    endIndent: 240,
                    color: HexColor('1BCFC9'),
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
                                        .jaAuthor
                                        .toString()
                                        .toUpperCase() +
                                    " " * 2,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: HexColor('1BCFC9'),
                                ),
                              ),
                              TextSpan(
                                  text: ' |  ',
                                  style: TextStyle(color: HexColor('000000'))),
                              TextSpan(
                                text: DateFormat("MMMM d, y")
                                    .format(Provider.of<MVP>(context).jaDate!)
                                    .toUpperCase(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: HexColor('1BCFC9'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Row(
                      //   children: [
                      //     IconButton(
                      //       padding: EdgeInsets.all(5),
                      //       onPressed: null,
                      //       icon: Image(
                      //         image: AssetImage("assets/images/logo_icon.png"),
                      //       ),
                      //     ),
                      //     IconButton(
                      //       padding: EdgeInsets.all(5),
                      //       onPressed: null,
                      //       icon: Image(
                      //         image: AssetImage("assets/images/logo_icon.png"),
                      //       ),
                      //     ),
                      //   ],
                      // ),
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
                      Provider.of<MVP>(context).jaImage,
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
                  data: Provider.of<MVP>(context).jaContent,
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
                        backgroundColor:
                            MaterialStateProperty.all(HexColor("1BCFC9")),
                        overlayColor:
                            MaterialStateProperty.all(HexColor("1BCFC9")),
                      ),
                      onPressed: () {
                        setState(() {
                          Provider.of<MVP>(context, listen: false).jaView =
                              false;
                        });
                      },
                      child: Text(
                        "Find Answers to More Questions",
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
                            text: "Highlights",
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
              width: 160,
              color: HexColor('FFFFFF'),
              child: Divider(
                thickness: 5,
                indent: 10,
                endIndent: 10,
                color: HexColor('1BCFC9'),
              ),
            ),
            EditorsPicks(
              data: widget.snapshot.data.allJAs,
              notifyParent: () => setState(() {}),
              ja: true,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 15),
              margin: EdgeInsets.zero,
              color: HexColor('FFFFFF'),
              child: Divider(
                thickness: 5,
                indent: 10,
                endIndent: 10,
                color: HexColor('1BCFC9'),
              ),
            ),
            FourTileCategory(
              notifyParent: () => setState(() {}),
              cardColor: 'FFFFFF',
              data: widget.snapshot.data.fthJAs,
              ja: true,
            ),
            FourTileCategory(
              notifyParent: () => setState(() {}),
              cardColor: 'D9D9D9',
              data: widget.snapshot.data.famJAs,
              ja: true,
            ),
            FourTileCategory(
              notifyParent: () => setState(() {}),
              cardColor: 'FFFFFF',
              data: widget.snapshot.data.frnJAs,
              ja: true,
            ),
            FourTileCategory(
              notifyParent: () => setState(() {}),
              cardColor: 'D9D9D9',
              data: widget.snapshot.data.giJAs,
              ja: true,
            ),
            FourTileCategory(
              notifyParent: () => setState(() {}),
              cardColor: 'FFFFFF',
              data: widget.snapshot.data.lifJAs,
              ja: true,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Image.asset("assets/images/sign.png"), flex: 2),
                Expanded(flex: 1, child: SizedBox()),
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      final url =
                          Uri.parse("https://www.youtube.com/c/MYVoiceCanada");
                      if (await canLaunchUrl(url)) await launchUrl(url);
                    },
                    child: ClipPath(
                      clipper: QuestionClipPath(),
                      child: Container(
                        color: HexColor("1BCFC9"),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: 10, top: 15, bottom: 15, left: 60),
                          child: AutoSizeText(
                            "For Just Ask questions answered in video format, check out our YouTube channel, MY Voice Canada!",
                            maxLines: 2,
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    text_utils.getadaptiveTextSize(context, 20),
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
    } else
      return MVLoading(
          message: "Uh oh, something's gone wrong! Please restart the app...");
  }
}
