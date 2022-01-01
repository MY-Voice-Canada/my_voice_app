import 'dart:convert';
import 'package:http/http.dart' as http;

class MVWP {
  static const String _baseUrl =
      "http://myvoicecanada.com/wp-json/wp/v2/posts?per_page=100&_embed";

  static Future<List> getAllPosts() async {
    try {
      var response = await http.get(Uri.parse(_baseUrl));
      //print("\"${jsonDecode(response.body)[1]["content"]["rendered"]}\"".replaceAll("\n", ""));
      if (response.statusCode == 200)
        return jsonDecode(response.body);
      else
        return Future.error("Server error");
    } catch (e) {
      print(e.toString());
      return Future.error("Error fetching data");
    }
  }
}
