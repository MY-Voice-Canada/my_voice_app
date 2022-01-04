import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:my_voice_app/models/category_text.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class ArticleSubTab extends StatelessWidget {
  final Function changePage;
  final data;

  ArticleSubTab({required this.data, required this.changePage});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  height: 114.0,
                  color: HexColor("FF3E62"),
                  child: Center(
                    child: Text(
                      "Articles",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 30),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Image.asset(
                  "assets/images/article_banner.png",
                  height: 114.0,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
          Container(
            height: 10.0,
            color: Colors.white,
          ),
          Text(
            "FEATURED",
            style: TextStyle(color: Colors.grey),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 10.0),
          GestureDetector(
            onTap: () {
              Provider.of<MVP>(context, listen: false).enableReadView(data[0]);
              changePage(1);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.network(
                      data[0]["_embedded"]["wp:featuredmedia"][0]["source_url"],
                      height: 250.0,
                      width: Provider.of<MVP>(context).screenWidth,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                MVCategoryText(data[0]["_embedded"]["wp:term"][0][0]["name"]
                    .toString()
                    .replaceAll("&amp;", "&")),
                Html(
                    data: "<h1>" +
                        data[0]["title"]["rendered"].toString() +
                        "</h1>"),
                Html(
                    style: {
                      "body": Style(
                        fontSize: FontSize(18.0),
                      )
                    },
                    data: data[0]["content"]["rendered"]
                            .toString()
                            .replaceAll("\n", "")
                            .replaceAll("<p>", "")
                            .replaceAll("</p>", "")
                            .replaceAll("&nbsp;", "")
                            .substring(0, 230) +
                        "...")
              ],
            ),
          ),
          SizedBox(height: 25.0),
          Container(
            height: 300.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, i) => i != 0
                  ? GestureDetector(
                      onTap: () {
                        Provider.of<MVP>(context, listen: false)
                            .enableReadView(data[i]);
                        changePage(1);
                      },
                      child: SizedBox(
                        width: 250.0,
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 250.0,
                                height: 150.0,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.network(
                                    data[i]["_embedded"]["wp:featuredmedia"][0]
                                        ["source_url"],
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              MVCategoryText(data[i]["_embedded"]["wp:term"][0]
                                  [0]["name"]),
                              ClipRect(
                                child: SizedBox(
                                  height: 100.0,
                                  child: data[i]["title"]["rendered"]
                                              .toString()
                                              .length >
                                          50
                                      ? Html(
                                          style: {
                                              "h2": Style(
                                                margin: EdgeInsets.zero,
                                                padding: EdgeInsets.zero,
                                              )
                                            },
                                          data: "<h2>" +
                                              data[i]["title"]["rendered"]
                                                  .toString()
                                                  .substring(0, 47) +
                                              "..."
                                                  "</h2>")
                                      : Html(
                                          style: {
                                              "h2": Style(
                                                margin: EdgeInsets.zero,
                                                padding: EdgeInsets.zero,
                                              )
                                            },
                                          data: "<h2>" +
                                              data[i]["title"]["rendered"]
                                                  .toString() +
                                              "</h2>"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : SizedBox.shrink(),
            ),
          ),
        ],
      ),
    );
  }
}
