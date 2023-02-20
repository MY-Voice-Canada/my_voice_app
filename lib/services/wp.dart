import 'dart:convert';
import 'package:html_unescape/html_unescape_small.dart';
import 'package:http/http.dart' as http;

class MVWP {
  static const defaultParameters = {
    "per_page": "20",
    "_embed": "true",
  };

  static const String _baseUrl = "myvoicecanada.com";

  static Uri API(String endpoint, {Map params = const {}}) =>
      Uri.http(_baseUrl, endpoint, {...defaultParameters, ...params});

  static Future<MVWPContent> getContent() async {
    print("WordPress: Started making website http requests.");
    try {
      final stopwatch = Stopwatch()..start();
      List<http.Response> responses = await Future.wait([
        http.get(API("/wp-json/wp/v2/posts", params: {
          "categories": "69,68,70,72,73",
          "per_page": "100"
        })), //all posts
        http.get(
            API("/wp-json/wp/v2/posts", params: {"categories": "69"})), //cw
        http.get(
            API("/wp-json/wp/v2/posts", params: {"categories": "68"})), //fth
        http.get(
            API("/wp-json/wp/v2/posts", params: {"categories": "70"})), // fft
        http.get(
            API("/wp-json/wp/v2/posts", params: {"categories": "72"})), //ii
        http.get(
            API("/wp-json/wp/v2/posts", params: {"categories": "73"})), //lae
        http.get(API("/wp-json/wp/v2/posts", params: {
          //all ja's
          "categories": "246,241,245,242,244,262",
          "per_page": "100"
        })),
        http.get(API("/wp-json/wp/v2/posts",
            params: {"categories": "246"})), //fth ja's
        http.get(API("/wp-json/wp/v2/posts",
            params: {"categories": "241"})), //fam ja's
        http.get(API("/wp-json/wp/v2/posts",
            params: {"categories": "245"})), // frn ja's
        http.get(API("/wp-json/wp/v2/posts",
            params: {"categories": "242"})), // gi ja's
        http.get(API("/wp-json/wp/v2/posts",
            params: {"categories": "244"})), // lif ja's
        http.get(API("/wp-json/wp/v2/posts", params: {"categories": "262"})),
      ]);

      stopwatch.stop();

      final HtmlUnescape unescape = HtmlUnescape();
      List<dynamic> posts = responses.map((response) {
        if (response.statusCode != 200)
          return Future.error(
              'WordPress Error: Could not load content from website. Failed in ${stopwatch.elapsed.inSeconds}s.');
        else
          return jsonDecode(
            response.body
                .replaceAll(RegExp("&amp;"), '&')
                .replaceAll(RegExp("&#038;"), '&')
                .replaceAll(RegExp("&#39;"), '\'')
                .replaceAll("&#8217;", '\'')
                .replaceAll("&#8211;", '–'),
          );
      }).toList();

      print(
          "WordPress: Successfully loaded content from website in ${stopwatch.elapsed.inSeconds}s.");

      return MVWPContent(
        allPosts: posts[0], // Pull only 11
        cwPosts: posts[1],
        fthPosts: posts[2],
        fftPosts: posts[3],
        iiPosts: posts[4],
        laePosts: posts[5],
        allJAs: posts[6], // Pull first
        fthJAs: posts[7],
        famJAs: posts[8],
        frnJAs: posts[9],
        giJAs: posts[10],
        lifJAs: posts[11],
      );
    } catch (error) {
      return Future.error(error);
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
  });
}

void main() async {
  print(MVWP.API("/wp-json/wp/v2/posts",
      params: {"categories": "52,365,524,523,54", "per_page": "100"}));
}
