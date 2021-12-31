import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:my_voice_app/models/dummy_article.dart';
import 'package:my_voice_app/models/user.dart';
import 'package:my_voice_app/services/wp.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../welcome/splashscreen.dart';
import './appbar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final MVUser user = Provider.of<MVUser?>(context)!;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text("Hello, ${user.displayName}!", style: TextStyle(fontSize: 48)),
        Divider(
          color: Colors.black,
        ),
        FutureBuilder<List>(
          future: MVWP.getAllPosts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return snapshot.data?.length == 0
                  ? Center(child: Text("No posts available at the moment."))
                  : Container(
                      height: 600.0,
                      child: ListView.builder(
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, i) => Card(
                          child: ListTile(
                            leading: Image.network(snapshot.data![i]
                                    ["_embedded"]["wp:featuredmedia"][0]
                                ["source_url"]),
                            title: Html(
                                data: "<h2>" +
                                    snapshot.data![i]["title"]["rendered"]
                                        .toString() +
                                    "</h2>"),
                            subtitle: Html(
                                data: snapshot.data![i]["content"]["rendered"]
                                    .toString()),
                          ),
                        ),
                      ),
                    );
            } else
              return Center(
                child: Text(snapshot.error.toString()),
              );
          },
        ),
      ],
    );
  }
}
