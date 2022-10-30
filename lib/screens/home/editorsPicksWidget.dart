import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:my_voice_app/main.dart';
import 'package:provider/provider.dart';

class EditorsPicks extends StatelessWidget {
  late final dynamic data;
  final Function notifyParent;
  final bool? ja;

  EditorsPicks({required this.data, required this.notifyParent, this.ja});

  @override
  Widget build(BuildContext context) {
    return Column(
      // from here begins the 3 boxes under 'editors picks' text
      children: [
        Card(
          margin: EdgeInsets.zero,
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  ja != null
                      ? Provider.of<MVP>(context, listen: false)
                          .enableJAView(data[0])
                      : Provider.of<MVP>(context, listen: false)
                          .enableReadView(data[0]);
                  notifyParent();
                },
                child: Column(
                  children: [
                    Container(
                      width: 400,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.fromLTRB(0, 0, 10, 5),
                      child: Html(
                        data: data[0]["title"]["rendered"].toString(),
                        style: {
                          "h1": Style(
                            fontWeight: FontWeight.bold,
                            fontSize: FontSize(20),
                            color: HexColor('000000'),
                          ),
                        },
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                      child: Text(
                        data[0]["_embedded"]["wp:term"][0][0]["name"],
                        style: TextStyle(
                          fontSize: 14,
                          color: HexColor('F5416C'),
                        ),
                      ),
                    ),
                    Container(
                      height: 200,
                      width: 400,
                      child: Card(
                        child: Image.network(
                          data[0]["_embedded"]["wp:featuredmedia"][0]
                              ["source_url"],
                          fit: BoxFit.fill,
                        ),
                        margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(5, 5, 5, 15),
                      child: Container(
                        width: 400,
                        margin: EdgeInsets.only(left: 5),
                        alignment: Alignment.centerLeft,
                        child: Html(
                          data: data[0]["content"]["rendered"]
                              .substring(0, 90)
                              .replaceAll('\n', ' '),
                          style: {
                            "h1": Style(
                              maxLines: 3,
                              fontSize: FontSize(13),
                              color: HexColor('000000'),
                            ),
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (var i = 1; i < 3; i++)
                    Expanded(
                      child: (GestureDetector(
                        onTap: () {
                          ja != null
                              ? Provider.of<MVP>(context, listen: false)
                                  .enableJAView(data[i])
                              : Provider.of<MVP>(context, listen: false)
                                  .enableReadView(data[i]);
                          notifyParent();
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 100,
                              width: 175,
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
                              padding: EdgeInsets.fromLTRB(10, 10, 0, 5),
                              child: Text(
                                data[i]["_embedded"]["wp:term"][0][0]["name"],
                                style: TextStyle(
                                  fontSize: 11,
                                  color: HexColor('F5416C'),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Text(
                                data[i]["title"]["rendered"].toString().length >
                                        22
                                    ? data[i]["title"]["rendered"]
                                            .toString()
                                            .substring(0, 10) +
                                        '...'
                                    : data[i]["title"]["rendered"].toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: HexColor('000000'),
                                ),
                              ),
                            ),
                            Container(
                              width: 175,
                              padding: EdgeInsets.fromLTRB(10, 0, 0, 5),
                              child: Html(
                                data: data[i]["content"]["rendered"]
                                    .substring(0, 80)
                                    .replaceAll('\n', ' '),
                                style: {
                                  "h1": Style(
                                    maxLines: 3,
                                    fontSize: FontSize(10),
                                    color: HexColor('000000'),
                                  ),
                                },
                              ),
                            ),
                          ],
                        ),
                      )),
                    ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
