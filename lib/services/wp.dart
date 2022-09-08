import 'dart:convert';
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
    try {
      List<http.Response> responses = await Future.wait([
        http.get(API("/wp-json/wp/v2/posts",
            params: {"categories": "52,365,524,523,54", "per_page": "100"})),
        http.get(API("/wp-json/wp/v2/posts", params: {"categories": "52"})),
        http.get(API("/wp-json/wp/v2/posts", params: {"categories": "365"})),
        http.get(API("/wp-json/wp/v2/posts", params: {"categories": "524"})),
        http.get(API("/wp-json/wp/v2/posts", params: {"categories": "523"})),
        http.get(API("/wp-json/wp/v2/posts", params: {"categories": "54"})),
        http.get(API("/wp-json/wp/v2/posts", params: {
          "categories": "661,659,658,655,657,656",
          "per_page": "100"
        })),
        http.get(API("/wp-json/wp/v2/posts", params: {"categories": "661"})),
        http.get(API("/wp-json/wp/v2/posts", params: {"categories": "659"})),
        http.get(API("/wp-json/wp/v2/posts", params: {"categories": "658"})),
        http.get(API("/wp-json/wp/v2/posts", params: {"categories": "655"})),
        http.get(API("/wp-json/wp/v2/posts", params: {"categories": "657"})),
        http.get(API("/wp-json/wp/v2/posts", params: {"categories": "656"})),
      ]);

      List<dynamic> posts = responses.map((response) {
        if (response.statusCode != 200) Future.error('error');
        return jsonDecode(response.body);
      }).toList();

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
