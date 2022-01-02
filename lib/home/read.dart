import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../welcome/splashscreen.dart';
import '../models/appbar.dart';

class ReadPage extends StatefulWidget {
  final snapshot;

  ReadPage({required this.snapshot});

  @override
  _ReadPageState createState() => _ReadPageState();
}

class _ReadPageState extends State<ReadPage> {
  @override
  Widget build(BuildContext context) {
    return Provider.of<MVP>(context).readView
        ? SingleChildScrollView(
            child: Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Column(
                children: [
                  Container(
                    child: Image.network(
                      Provider.of<MVP>(context).readImage,
                      height: 250.0,
                      width: Provider.of<MVP>(context).screenWidth,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Html(
                      data: "<h1>" +
                          Provider.of<MVP>(context).readTitle.toString() +
                          "</h1>"),
                  Html(data: Provider.of<MVP>(context).readContent.toString()),
                  SizedBox(height: 100.0),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          Provider.of<MVP>(context, listen: false).readView = false;
                        });
                      },
                      child: Text("Go Back")),
                      SizedBox(height: 20.0),
                ],
              ),
            ),
          )
        : Container(
            color: Colors.red,
          );
  }
}
