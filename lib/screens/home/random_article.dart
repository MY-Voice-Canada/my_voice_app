import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:my_voice_app/main.dart';
import 'package:provider/provider.dart';
import 'dart:math';

class RandomArticle extends StatelessWidget {
  late final dynamic data;
  final Function notifyParent;
  final bool? ja;
  int random = 0 + Random().nextInt(30 - 0);

  RandomArticle({required this.data, required this.notifyParent, this.ja});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Container(
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
            children: [
              Container(
                width: 400,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
                child: Text(
                  data[random]["title"]["rendered"].toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
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
              Container(
                padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                child: Container(
                  width: 400,
                  margin: EdgeInsets.only(left: 5),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    data[random]["content"]["rendered"],
                    maxLines: 3,
                    style: TextStyle(
                      fontSize: 13,
                      color: HexColor('000000'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
