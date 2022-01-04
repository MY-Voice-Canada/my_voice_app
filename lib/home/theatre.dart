import 'package:flutter/material.dart';
import 'package:my_voice_app/main.dart';
import 'package:my_voice_app/models/appbar.dart';
import 'package:my_voice_app/models/background_image.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MVTheatre extends StatefulWidget {
  final String videoId;

  MVTheatre({required this.videoId});

  @override
  _MVTheatreState createState() => _MVTheatreState();
}

class _MVTheatreState extends State<MVTheatre> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MVBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: getMVAppBar(context),
        body: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          onReady: () {
            print('Player is ready.');
          },
        ),
      ),
    );
  }
}
