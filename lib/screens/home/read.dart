import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:my_voice_app/main.dart';
import 'package:my_voice_app/models/category_text.dart';
import 'package:my_voice_app/models/loading.dart';
import 'package:my_voice_app/screens/home/category_subtab.dart';
import 'package:provider/provider.dart';

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
              MVCategoryText(
                Provider.of<MVP>(context).readCategory,
                version: MVCTVersion.pink,
              ),
              SizedBox(
                height: 20.0,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  Provider.of<MVP>(context).readImage,
                  height: 250.0,
                  width: Provider.of<MVP>(context).screenWidth,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Html(
                  style: {
                    "h1": Style(
                      fontSize: FontSize(56.0),
                      margin: EdgeInsets.zero,
                    ),
                  },
                  data: "<h1>" +
                      Provider.of<MVP>(context).readTitle.toString() +
                      "</h1>"),
              SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Row(
                  children: [
                    RichText(
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
                                " " * 15,
                          ),
                          TextSpan(
                            text: DateFormat("MMMM d, y")
                                .format(Provider.of<MVP>(context).readDate!)
                                .toUpperCase(),
                          ),
                        ],
                      ),
                    ),
                  ],
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
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                padding: EdgeInsets.only(left: 10.0),
                alignment: Alignment.centerLeft,
                width: double.infinity,
                height: 240.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/home_header.png"),
                      fit: BoxFit.fill),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.0),
                  child: RichText(
                    text: TextSpan(
                        style: TextStyle(
                            fontSize: 56,
                            fontWeight: FontWeight.bold,
                            fontFamily: "RobotoMono"),
                        children: [
                          TextSpan(
                              text: "Read Our",
                              style: TextStyle(color: Colors.black)),
                          TextSpan(
                              text: "\nYouth-made Articles",
                              style: TextStyle(
                                  color: Theme.of(context).secondaryHeaderColor,
                                  fontSize: 36)),
                        ]),
                  ),
                ),
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
