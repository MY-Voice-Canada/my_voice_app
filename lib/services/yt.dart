import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:my_voice_app/models/channel.dart';
import 'package:my_voice_app/models/video.dart';
import 'package:my_voice_app/services/api_keys.dart';

class MVYT {
  MVYT._instantiate();

  static final MVYT instance = MVYT._instantiate();

  final String _baseUrl = "www.googleapis.com";
  String _nextPageToken = "";

  Future<Channel> fetchChannel({required String channelId}) async {
    Map<String, String> parameters = {
      "part": "snippet, contentDetails, statistics",
      "id": channelId,
      "key": YOUTUBE_API_KEY,
    };

    Uri uri = Uri.https(_baseUrl, "/youtube/v3/channels", parameters);

    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: "application/json",
    };

    var response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body)["items"][0];
      Channel channel = Channel.fromMap(data);

      channel.videos = await fetchVideos(
        playlistId: channel.uploadPlaylistId,
      );
      return channel;
    } else
      return Future.error("Server error.");
  }

  Future<List<Video>> fetchVideos({required String playlistId}) async {
    Map<String, String> parameters = {
      "part": "snippet",
      "playlistId": playlistId,
      "maxResults": "20",
      "pageToken": _nextPageToken,
      "key": YOUTUBE_API_KEY,
    };

    Uri uri = Uri.https(
      _baseUrl,
      "youtube/v3/playlistItems",
      parameters,
    );

    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: "application/json",
    };

    var response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      dynamic data = json.decode(response.body);

      _nextPageToken = data["nextPageToken"] ?? "";
      List<dynamic> videosJson = data["items"];
      List<Video> videos = [];

      videosJson.forEach(
          (videoJson) => videos.add(Video.fromMap(videoJson)));

      return videos;
    } else {
      print(json.decode(response.body)["error"]["message"]);
      return Future.error(json.decode(response.body)["error"]["message"]);
    }
  }
}
