import 'package:flutter/material.dart';
import 'package:my_voice_app/models/video.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MVTheatre extends StatefulWidget {
  final Video video;

  MVTheatre({required this.video});

  @override
  MVTheatreState createState() => MVTheatreState();
}

class MVTheatreState extends State<MVTheatre> {
  late YoutubePlayerController _controller;

  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.video.id,
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        showLiveFullscreenButton: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          YoutubePlayer(
            controller: _controller,
            bottomActions: [
              const SizedBox(width: 14.0),
              CurrentPosition(),
              const SizedBox(width: 8.0),
              ProgressBar(
                isExpanded: true,
              ),
              RemainingDuration(),
              const PlaybackSpeedButton(),
            ],
            showVideoProgressIndicator: true,
            onReady: () {},
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            child: Text(
              widget.video.title,
              style: TextStyle(fontSize: 34.0, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
