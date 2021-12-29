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
    create: (_) => MVProvider(),
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
          primaryColor: HexColor("139DA4"),
          fontFamily: "RobotoMono",
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

class MVProvider extends ChangeNotifier {
  double screenHeightAppbarless = 0;
  double screenWidth = 0;
  double buttonFontSize = 24;

  String userEmail = "";
  String userPassword = "";
}
