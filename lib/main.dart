import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './pages/splashscreen.dart';
import './pages/home.dart';

void main() => runApp(ChangeNotifierProvider(
      create: (_) => MYVMProvider(),
      child: MYVMApp(),
    ));

class MYVMApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<MYVMProvider>(context).screenHeightAppbarless = ((MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top) as int);

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

class MYVMProvider extends ChangeNotifier {
  int screenHeightAppbarless = 0;
}
