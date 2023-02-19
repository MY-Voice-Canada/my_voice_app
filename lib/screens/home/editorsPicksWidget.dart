import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:my_voice_app/main.dart';
import 'package:provider/provider.dart';
import 'package:my_voice_app/utils/html.dart' as html;
import 'package:my_voice_app/utils/text.dart' as text_utils;

class EditorsPicks extends StatelessWidget {
  late final dynamic data;
  final Function notifyParent;
  final bool? ja;

  EditorsPicks({required this.data, required this.notifyParent, this.ja});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    var smallText = [20.0, 16.0, 13.0];
    var bigText = [30.0, 26.0, 23.0];
    return Column(
      // from here begins the 3 boxes under 'editors picks' text
      children: [
        Card(
          margin: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (screenWidth < 625)
                for (var i = 0; i < 3; i++)
                  (buildOneTile(context, i, 400, 200, smallText)),
              if (screenWidth > 625) ...[
                buildOneTile(context, 0, 600, 300, bigText),
                sideBySideTiles(context, smallText),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget buildOneTile(
      BuildContext context, i, double width, double height, var textSizes) {
    return Center(
      child: GestureDetector(
        onTap: () {
          ja != null
              ? Provider.of<MVP>(context, listen: false).enableJAView(data[i])
              : Provider.of<MVP>(context, listen: false)
                  .enableReadView(data[i]);
          notifyParent();
        },
        child: Column(
          children: [
            Container(
              width: width,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.fromLTRB(0, 0, 10, 5),
              child: Html(
                data: data[i]["title"]["rendered"].toString(),
                style: {
                  "body": Style(
                    fontWeight: FontWeight.bold,
                    fontSize: FontSize(textSizes[0]),
                    color: HexColor('000000'),
                  ),
                },
              ),
            ),
            Container(
              width: width,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Text(
                data[i]["_embedded"]["wp:term"][0][0]["name"],
                style: TextStyle(
                  fontSize: textSizes[1],
                  color: HexColor('F5416C'),
                ),
              ),
            ),
            Container(
              height: height,
              width: width,
              child: Card(
                child: Image.network(
                  data[i]["_embedded"]["wp:featuredmedia"][0]["source_url"],
                  fit: BoxFit.fill,
                ),
                margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(5, 5, 5, 15),
              child: Container(
                width: width,
                margin: EdgeInsets.only(left: 5),
                alignment: Alignment.centerLeft,
                child: Html(
                  data: text_utils.limit(
                      180,
                      html.stripMarkup(Provider.of<MVP>(context)
                          .headingRemover(data[i]['content']['rendered'])),
                      overflow: "..."),
                  style: {
                    "body": Style(
                      maxLines: 3,
                      fontSize: FontSize(textSizes[2]),
                      color: HexColor('000000'),
                    ),
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget sideBySideTiles(BuildContext context, var textSizes) {
    return Container(
      width: 600,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (var i = 1; i < 3; i++)
            (GestureDetector(
              onTap: () {
                ja != null
                    ? Provider.of<MVP>(context, listen: false)
                        .enableJAView(data[i])
                    : Provider.of<MVP>(context, listen: false)
                        .enableReadView(data[i]);
                notifyParent();
              },
              child: Container(
                width: 300,
                child: Column(
                  children: [
                    Container(
                      height: 150,
                      width: 300,
                      child: Card(
                        child: Image.network(
                          data[i]["_embedded"]["wp:featuredmedia"][0]
                              ["source_url"],
                          fit: BoxFit.fill,
                        ),
                        margin: EdgeInsets.all(10),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: Text(
                        data[i]["_embedded"]["wp:term"][0][0]["name"],
                        style: TextStyle(
                          fontSize: textSizes[1],
                          color: HexColor('F5416C'),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: Html(
                        data: data[i]["title"]["rendered"].toString(),
                        style: {
                          "body": Style(
                            fontWeight: FontWeight.bold,
                            fontSize: FontSize(textSizes[0]),
                            color: HexColor('000000'),
                          ),
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(5, 5, 5, 15),
                      child: Container(
                        width: 300,
                        margin: EdgeInsets.only(left: 5),
                        alignment: Alignment.centerLeft,
                        child: Html(
                          data: text_utils.limit(
                              180,
                              html.stripMarkup(Provider.of<MVP>(context)
                                  .headingRemover(
                                      data[i]['content']['rendered'])),
                              overflow: "..."),
                          style: {
                            "body": Style(
                              maxLines: 3,
                              fontSize: FontSize(textSizes[2]),
                              color: HexColor('000000'),
                            ),
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
        ],
      ),
    );
  }
}
