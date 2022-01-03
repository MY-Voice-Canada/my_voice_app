import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class MVCategoryText extends StatelessWidget {
  final String data;
  final double? fontSize;

  MVCategoryText(this.data, {this.fontSize});

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      margin: EdgeInsets.symmetric(horizontal: 3.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(3.0)),
          color: Theme.of(context).secondaryHeaderColor),
      child: AutoSizeText(
        data.replaceAll("&amp;", "&").toUpperCase(),
        style: TextStyle(color: Colors.white, fontSize: fontSize ?? 18.0),
        maxLines: 1,
      ),
    );
  }
}
