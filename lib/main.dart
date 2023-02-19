import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:my_voice_app/models/channel.dart';
import 'package:my_voice_app/models/user.dart';
import 'package:my_voice_app/models/video.dart';
import 'package:my_voice_app/screens/home/home_widget.dart';
import 'package:my_voice_app/screens/upper/settings.dart';
import 'package:my_voice_app/screens/welcome/register.dart';
import 'package:my_voice_app/screens/welcome/sign_in.dart';
import 'package:my_voice_app/screens/welcome/splashscreen.dart';
import 'package:my_voice_app/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MYVoiceApp());
}

Widget MYVoiceApp() => ChangeNotifierProvider(
      create: (_) => MVP(),
      child: MVApp(),
    );

class MVApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MVUser?>.value(
      value: MVAuth().userStream,
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "MY Voice App",
        initialRoute: "/",
        routes: {
          "/": (context) => MVWrapper(),
          "/home": (context) => MVHome(),
          "/splash": (context) => MVSplashScreen(),
          "/signin": (context) => MVSignIn(),
          "/register": (context) => MVRegister(),
          "/settings": (context) => MVSettings(),
        },
        theme: ThemeData(
          primaryColor: HexColor("1BCFC9"),
          secondaryHeaderColor: HexColor("F5416C"),
          fontFamily: "Poppins",
        ),
      ),
    );
  }
}

class MVWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MVUser? user = Provider.of<MVUser?>(context);
    return Phoenix(child: user == null ? MVSplashScreen() : MVHome());
  }
}

enum MVCTVersion { pink, yellow, black, green, white, transparent }

class MVP extends ChangeNotifier {
  String? userName;
  late double screenHeightAppbarless;
  late double screenWidth;

  String headingRemover(String htmlBody) {
    // This function removes a title heading in an html body of text if there is one
    if (htmlBody[1] == 'h') {
      int cutoff = 0;
      for (int i = 0; i < htmlBody!.length - 3; i++) {
        if (htmlBody.substring(i, i + 3) == "</h") {
          cutoff = i + 5;
          break;
        }
      }
      return htmlBody.substring(cutoff);
    } else
      return htmlBody;
  }

  // For JAPage:
  bool jaView = false;
  dynamic jaImage;
  dynamic jaTitle;
  String? jaContent;
  dynamic jaCategory;
  dynamic jaAuthor;
  DateTime? jaDate;

  void enableJAView(dynamic question) {
    jaView = true;
    jaImage = question["_embedded"]["wp:featuredmedia"][0]["source_url"];
    jaTitle = question["title"]["rendered"];
    jaCategory = question["_embedded"]["wp:term"][0][0]["name"];
    jaAuthor = question["_embedded"]["author"][0]["name"];

    jaDate = DateTime.parse(question["date"]);
    if (jaContent != null) jaContent = headingRemover(jaContent!);
  }

// For ReadPage:
  bool readView = false;
  dynamic readImage;
  dynamic readTitle;
  String? readContent;
  dynamic readCategory;
  dynamic readAuthor;
  DateTime? readDate;

  void enableReadView(dynamic article) {
    readView = true;
    readImage = article["_embedded"]["wp:featuredmedia"][0]["source_url"];
    readTitle = article["title"]["rendered"];
    readCategory = article["_embedded"]["wp:term"][0][0]["name"];
    readAuthor = article["_embedded"]["author"][0]["name"];

    readDate = DateTime.parse(article["date"]);
    readContent = article["content"]["rendered"].toString();
    if (readContent != null) readContent = headingRemover(readContent!);
  }

  // For WatchPage:
  Channel? channel;
  Map<String, List<Video>>? playlists;
  Video? watchVideo;
  bool watchView = false;
}
