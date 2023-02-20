import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:my_voice_app/main.dart';
import 'package:provider/provider.dart';
import 'dart:math';
import 'package:flutter_html/flutter_html.dart';

class RandomArticle extends StatelessWidget {
  late final dynamic data;
  final Function notifyParent;
  final bool? ja;
  int random = 0 + Random().nextInt(30 - 0);

  RandomArticle({required this.data, required this.notifyParent, this.ja});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: HexColor('D9D9D9'),
      margin: EdgeInsets.zero,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(15, 20, 5, 0),
            child: Text(
              'Random',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 21,
                color: HexColor('000000'),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(5, 20, 5, 10),
            child: GestureDetector(
              onTap: () {
                ja != null
                    ? Provider.of<MVP>(context, listen: false)
                        .enableJAView(data[random])
                    : Provider.of<MVP>(context, listen: false)
                        .enableReadView(data[random]);
                notifyParent();
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 400,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
                    child: Text(
                      data[random]["title"]["rendered"]
                          .toString()
                          .replaceAll(RegExp("&amp;"), '&')
                          .replaceAll(RegExp("&#038;"), '&')
                          .replaceAll(RegExp("&#39;"), '\'')
                          .replaceAll("&#8217;", '\'')
                          .replaceAll("&#8211;", '–'),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: HexColor('000000'),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                    child: Text(
                      data[random]["_embedded"]["wp:term"][0][0]["name"],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
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
                        data[random]["_embedded"]["wp:featuredmedia"][0]
                            ["source_url"],
                        fit: BoxFit.fill,
                      ),
                      margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
