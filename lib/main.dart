import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:my_voice_app/models/channel.dart';
import 'package:my_voice_app/models/user.dart';
import 'package:my_voice_app/models/video.dart';
import 'package:my_voice_app/screens/home/home_widget.dart';
import 'package:my_voice_app/screens/welcome/splashscreen.dart';
import 'package:my_voice_app/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
    create: (_) => MVP(),
    child: MVApp(),
  ));
}

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
        },
        theme: ThemeData(
          primaryColor: HexColor("1BCFC9"),
          secondaryHeaderColor: HexColor("F5416C"),
          fontFamily: "Raleway",
        ),
      ),
    );
  }
}

class MVWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MVUser? user = Provider.of<MVUser?>(context);
    print(user);
    return Phoenix(child: user == null ? MVSplashScreen() : MVHome());
  }
}

enum MVCTVersion { pink, yellow, black, green }

class MVP extends ChangeNotifier {
  late double screenHeightAppbarless;
  late double screenWidth;

  // For JAPage:
  bool jaView = false;
  dynamic jaImage;
  dynamic jaTitle;
  dynamic jaContent;
  dynamic jaCategory;
  dynamic jaAuthor;
  DateTime? jaDate;

  void enableJAView(dynamic question) {
    jaView = true;
    jaImage = question["_embedded"]["wp:featuredmedia"][0]["source_url"];
    jaTitle = question["title"]["rendered"];
    jaContent = question["content"]["rendered"];
    jaCategory = question["_embedded"]["wp:term"][0][0]["name"];
    jaAuthor = question["_embedded"]["author"][0]["name"];
    jaDate = DateTime.parse(question["date"]);
  }

// For ReadPage:
  bool readView = false;
  dynamic readImage;
  dynamic readTitle;
  dynamic readContent;
  dynamic readCategory;
  dynamic readAuthor;
  DateTime? readDate;

  void enableReadView(dynamic article) {
    readView = true;
    readImage = article["_embedded"]["wp:featuredmedia"][0]["source_url"];
    readTitle = article["title"]["rendered"];
    readContent = article["content"]["rendered"];
    readCategory = article["_embedded"]["wp:term"][0][0]["name"];
    readAuthor = article["_embedded"]["author"][0]["name"];
    readDate = DateTime.parse(article["date"]);
  }

  // For WatchPage:
  Channel? channel;
  Map<String, List<Video>>? playlists;
  Video? watchVideo;
  bool watchView = false;
}
