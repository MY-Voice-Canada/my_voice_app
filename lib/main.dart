import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:my_voice_app/home/home_widget.dart';
import 'package:my_voice_app/models/user.dart';
import 'package:my_voice_app/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import './welcome/splashscreen.dart';

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
        theme: ThemeData(
          primaryColor: HexColor("1BCFC9"),
          secondaryHeaderColor: HexColor("F5416C"),
          fontFamily: "Raleway",
        ),
        home: MVWrapper(),
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

class MVP extends ChangeNotifier {
  //For ReadPage
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

  late double screenHeightAppbarless;
  late double screenWidth;
}
