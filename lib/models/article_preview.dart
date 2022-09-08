import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:my_voice_app/utils/text.dart' as text_utils;

class ArticlePreview extends StatelessWidget {
  final String title;
  final String description;
  final String thumbnailSrc;
  final String categoryName;

  final Color accentColor;

  const ArticlePreview(
      {Key? key,
      required this.title,
      required this.description,
      required this.categoryName,
      required this.thumbnailSrc,
      this.accentColor = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final window = MediaQuery.of(context).size;

    print(window.width);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Container(
            decoration: BoxDecoration(
                boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black38)]),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  this.thumbnailSrc,
                  fit: BoxFit.fitWidth,
                )),
          ),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              this.categoryName,
              style: TextStyle(fontSize: 15, color: this.accentColor),
            )),
        Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child: Text(
              this.title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              text_utils.limit(250, this.description),
              softWrap: true,
              style: TextStyle(
                  fontSize: text_utils.getadaptiveTextSize(context, 12)),
            )),
      ],
    );
  }
}
