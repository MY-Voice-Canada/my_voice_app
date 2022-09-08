import 'package:html/parser.dart' as html;

String stripMarkup(String markup) {
  final document = html.parse(markup);
  return document.body?.text ?? "";
}
