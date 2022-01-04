import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:my_voice_app/main.dart';

class MVCategoryText extends StatelessWidget {
  final String data;
  final double? fontSize;
  final MVCTVersion version;

  MVCategoryText(this.data, {this.fontSize, required this.version});

  Widget build(BuildContext context) {
    final Color categoryColor;
    switch (version) {
      case MVCTVersion.pink:
        categoryColor = Theme.of(context).secondaryHeaderColor;
        break;
      case MVCTVersion.yellow:
        categoryColor = HexColor("FFBF3B");
        break;
      case MVCTVersion.black:
        categoryColor = Colors.black;
        break;
      case MVCTVersion.green:
        categoryColor = HexColor("FFFFFF");
        break;
    }

    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      margin: EdgeInsets.symmetric(horizontal: 3.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(3.0)),
        color: categoryColor,
      ),
      child: AutoSizeText(
        data.replaceAll("&amp;", "&").toUpperCase(),
        style: TextStyle(
            color: version == MVCTVersion.yellow ? Colors.black : Colors.white,
            fontSize: fontSize ?? 18.0),
        maxLines: 1,
      ),
    );
  }
}
