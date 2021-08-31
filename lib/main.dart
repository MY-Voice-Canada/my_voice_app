import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './pages/splashscreen.dart';
import './pages/home.dart';

void main() => runApp(MYVMApp());

class MYVMApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = (MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top).toInt();
    //Provider.of<MYVMProvider>(context).screenHeightAppbarless = 20;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "MY Voice App",
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MYVMASplashScreen(),
    );
  }
}

/*class MYVMProvider extends ChangeNotifier {
  int screenHeightAppbarless = 0;
}*/