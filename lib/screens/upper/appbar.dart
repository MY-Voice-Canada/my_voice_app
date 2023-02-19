import 'package:flutter/material.dart';
import 'package:my_voice_app/main.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

AppBar getMVAppBar(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    elevation: 0,
    leading: IconButton(
        icon: Icon(
          Icons.hail_outlined,
          color: Colors.white,
        ),
        onPressed: () async {
          final url = Uri.parse(
              "https://crm.bloomerang.co/HostedDonation?ApiKey=pub_7f79bc33-bc0a-11ec-be05-02d341daa68d&WidgetId=28672");
          if (await canLaunchUrl(url)) await launchUrl(url);
        }),
    //IconButton(
    //   icon: Icon(Icons.search),
    //   onPressed: () => null,
    // ),
    centerTitle: true,
    title: GestureDetector(
      onTap: () => Navigator.of(context).pushReplacementNamed("/home"),
      child: Center(
        child: Image.asset("./assets/images/logo.png", height: 50),
      ),
    ),
    backgroundColor: Theme.of(context).primaryColor,
    actions: [
      // IconButton(
      //   icon: Icon(
      //     Icons.favorite,
      //     color: Colors.white,
      //   ),
      //   onPressed: () => null,
      // ),
      IconButton(
        icon: Icon(
          Icons.settings,
          color: Colors.white,
        ),
        onPressed: () =>
            Navigator.of(context).pushReplacementNamed("/settings"),
      ),
    ],
  );
}
