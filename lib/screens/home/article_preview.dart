import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:my_voice_app/main.dart';
import 'package:my_voice_app/utils/text.dart' as text_utils;
import 'package:provider/provider.dart';

class ArticlePreview extends StatelessWidget {
  final String title;
  final String description;
  final String thumbnailSrc;
  final String categoryName;
  final dynamic article;
  final Function changeToReadPage;

  final Color accentColor;

  const ArticlePreview(
      {Key? key,
      required this.title,
      required this.description,
      required this.categoryName,
      required this.thumbnailSrc,
      required this.article,
      required this.changeToReadPage,
      this.accentColor = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<MVP>(context, listen: false).enableReadView(article);
        this.changeToReadPage();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                    width: Provider.of<MVP>(context).screenWidth / 1.5,
                    height: 150,
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
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
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
      ),
    );
  }
}
