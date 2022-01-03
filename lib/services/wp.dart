import 'dart:convert';
import 'package:http/http.dart' as http;

class MVWP {
  static const String _baseUrl =
      "http://myvoicecanada.com/wp-json/wp/v2/posts?per_page=20&_embed";

  static Future<MVWPContent> getContent() async {
    try {
      List<dynamic> responses = [
        await http.get(Uri.parse("$_baseUrl&categories=52,365,524,523,54"
            .replaceAll("per_page=20", "per_page=100"))),
        await http.get(Uri.parse("$_baseUrl&categories=52")),
        await http.get(Uri.parse("$_baseUrl&categories=365")),
        await http.get(Uri.parse("$_baseUrl&categories=524")),
        await http.get(Uri.parse("$_baseUrl&categories=523")),
        await http.get(Uri.parse("$_baseUrl&categories=54")),
        await http.get(Uri.parse("$_baseUrl&categories=661,659,658,655,657,656"
            .replaceAll("per_page=20", "per_page=100"))),
        await http.get(Uri.parse("$_baseUrl&categories=661")),
        await http.get(Uri.parse("$_baseUrl&categories=659")),
        await http.get(Uri.parse("$_baseUrl&categories=658")),
        await http.get(Uri.parse("$_baseUrl&categories=655")),
        await http.get(Uri.parse("$_baseUrl&categories=657")),
        await http.get(Uri.parse("$_baseUrl&categories=656")),
      ];

      List<dynamic> posts = List.filled(responses.length, dynamic);

      for (int i = 0; i < responses.length; i++) {
        if (responses[i].statusCode == 200) {
          posts[i] = jsonDecode(responses[i].body);
        } else
          return Future.error("Server error");
      }

      print("Synced with website");
      return MVWPContent(
        allPosts: posts[0],
        cwPosts: posts[1],
        fthPosts: posts[2],
        fftPosts: posts[3],
        iiPosts: posts[4],
        laePosts: posts[5],
        allJAs: posts[6],
        fthJAs: posts[7],
        famJAs: posts[8],
        frnJAs: posts[9],
        giJAs: posts[10],
        lifJAs: posts[11],
        socJAs: posts[12],
      );
    } catch (e) {
      print(e.toString());
      return Future.error("Error fetching data");
    }
  }
}

class MVWPContent {
  final dynamic allPosts;
  final dynamic cwPosts;
  final dynamic fthPosts;
  final dynamic fftPosts;
  final dynamic iiPosts;
  final dynamic laePosts;

  final dynamic allJAs;
  final dynamic fthJAs;
  final dynamic famJAs;
  final dynamic frnJAs;
  final dynamic giJAs;
  final dynamic lifJAs;
  final dynamic socJAs;

  MVWPContent({
    this.allPosts,
    this.cwPosts,
    this.fftPosts,
    this.fthPosts,
    this.iiPosts,
    this.laePosts,
    this.allJAs,
    this.fthJAs,
    this.famJAs,
    this.frnJAs,
    this.giJAs,
    this.lifJAs,
    this.socJAs,
  });
}
