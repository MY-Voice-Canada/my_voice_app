import 'package:flutter/material.dart';
import 'package:my_voice_app/utils/text.dart' as text_utils;

class VideoPreview extends StatelessWidget {
  final String title;
  final String videoThumbnailSrc;
  final String channelTitle;

  const VideoPreview(
      {Key? key,
      required this.title,
      required this.videoThumbnailSrc,
      required this.channelTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            child: ClipRRect(
              child: Image.network(
                this.videoThumbnailSrc,
                fit: BoxFit.fitWidth,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            width: double.infinity),
        Padding(
            child: Text(this.channelTitle,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.amber[400],
                )),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4)),
        Padding(
            child: Text(
              this.title,
              style: TextStyle(
                  fontSize: text_utils.getadaptiveTextSize(context, 17),
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              softWrap: true,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 4)),
      ],
    );
  }
}
