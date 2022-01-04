class Video {
  final String id;
  final String title;
  final String thumbnailUrl;
  final String channelTitle;

  Video({
    required this.id,
    required this.title,
    required this.thumbnailUrl,
    required this.channelTitle,
  });

  factory Video.fromMap(dynamic videoJson) {
    return Video(
      id: videoJson["snippet"]['resourceId']['videoId'],
      title: videoJson["snippet"]['title'],
      thumbnailUrl: videoJson["snippet"]['thumbnails']['high']['url'],
      channelTitle: videoJson["snippet"]['channelTitle'],
    );
  }
}
