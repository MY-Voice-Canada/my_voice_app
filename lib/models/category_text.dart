import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class MVCategoryText extends StatelessWidget {
  final String data;

  MVCategoryText(this.data);

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(3.0)),
          color: Theme.of(context).secondaryHeaderColor),
      child: AutoSizeText(
        data.replaceAll("&amp;", "&").toUpperCase(),
        style: TextStyle(color: Colors.white, fontSize: 18.0),
        maxLines: 1,
      ),
    );
  }
}
