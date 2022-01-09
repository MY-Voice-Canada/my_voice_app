import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:my_voice_app/main.dart';
import 'package:my_voice_app/models/category_text.dart';
import 'package:my_voice_app/models/loading.dart';
import 'package:my_voice_app/models/user.dart';
import 'package:my_voice_app/screens/home/category_subtab.dart';
import 'package:my_voice_app/services/db.dart';
import 'package:provider/provider.dart';

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
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5.0,
              ),
              MVCategoryText(
                Provider.of<MVP>(context).jaCategory,
                version: MVCTVersion.black,
              ),
              SizedBox(
                height: 20.0,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  Provider.of<MVP>(context).jaImage,
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
                      Provider.of<MVP>(context).jaTitle.toString() +
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
                          color: Colors.black,
                          fontSize: 18.0,
                        ),
                        children: [
                          TextSpan(
                            text: Provider.of<MVP>(context)
                                    .jaAuthor
                                    .toString()
                                    .toUpperCase() +
                                " " * 15,
                          ),
                          TextSpan(
                            text: DateFormat("MMMM d, y")
                                .format(Provider.of<MVP>(context).jaDate!)
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
                data: Provider.of<MVP>(context).jaContent.toString(),
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
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      overlayColor:
                          MaterialStateProperty.all(HexColor("FFBF3B")),
                    ),
                    onPressed: () {
                      setState(() {
                        Provider.of<MVP>(context, listen: false).jaView = false;
                      });
                    },
                    child: Text(
                      "Find the Answer to Something Else",
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
            TextButton(
              onPressed: () {
                MVDB(uid: user.uid).addUserQuestion(
                    name: user.displayName,
                    email: user.email,
                    question: "What is 9+10?");
              },
              child: Text("Ask Question"),
            ),
            SizedBox(
              height: 20.0,
            ),
            CategorySubTab(
              notifyParent: () => setState(() {}),
              data: widget.snapshot.data.fthJAs,
              ja: true,
            ),
            SizedBox(
              height: 20.0,
            ),
            CategorySubTab(
              notifyParent: () => setState(() {}),
              data: widget.snapshot.data.famJAs,
              ja: true,
            ),
            SizedBox(
              height: 20.0,
            ),
            CategorySubTab(
              notifyParent: () => setState(() {}),
              data: widget.snapshot.data.giJAs,
              ja: true,
            ),
            SizedBox(
              height: 20.0,
            ),
            CategorySubTab(
              notifyParent: () => setState(() {}),
              data: widget.snapshot.data.lifJAs,
              ja: true,
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
