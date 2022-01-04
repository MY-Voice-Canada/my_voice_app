import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:hexcolor/hexcolor.dart';

class MVCategoryText extends StatelessWidget {
  final String data;
  final double? fontSize;
  final bool? yellowVersion;
  final bool? blackVersion;

  MVCategoryText(this.data,
      {this.fontSize, this.yellowVersion, this.blackVersion});

  Widget build(BuildContext context) {
    final Color categoryColor = yellowVersion != null
        ? HexColor("FFBF3B")
        : blackVersion != null
            ? Colors.black
            : Theme.of(context).secondaryHeaderColor;

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
            color: yellowVersion != null ? Colors.black : Colors.white,
            fontSize: fontSize ?? 18.0),
        maxLines: 1,
      ),
    );
  }
}
