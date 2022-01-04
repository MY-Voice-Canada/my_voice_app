import 'package:flutter/material.dart';
import 'package:my_voice_app/home/theatre.dart';
import 'package:my_voice_app/models/channel.dart';
import 'package:my_voice_app/models/loading.dart';
import 'package:my_voice_app/models/video.dart';
import 'package:my_voice_app/services/yt.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../welcome/splashscreen.dart';
import '../models/appbar.dart';

class WatchPage extends StatefulWidget {
  Channel? channel;

  WatchPage({required this.channel});

  @override
  _WatchPageState createState() => _WatchPageState();
}

class _WatchPageState extends State<WatchPage> {
  _buildVideo(Video video) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => MVTheatre(videoId: video.id),
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        padding: EdgeInsets.all(10.0),
        height: 140.0,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 1),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            Image(
              width: 150.0,
              image: NetworkImage(video.thumbnailUrl),
            ),
            SizedBox(width: 10.0),
            Expanded(
              child: Text(
                video.title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.channel == null
        ? MVLoading(
            message: "Count your blessings while we're loading...",
          )
        : ListView.builder(
            itemCount: widget.channel!.videos!.length,
            itemBuilder: (context, i) {
              return _buildVideo(widget.channel!.videos![i]);
            },
          );
  }
}
