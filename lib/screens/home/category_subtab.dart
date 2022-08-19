import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:my_voice_app/main.dart';
import 'package:my_voice_app/models/category_text.dart';
import 'package:provider/provider.dart';

class CategorySubTab extends StatelessWidget {
  final Function notifyParent;
  late final dynamic data;
  final bool? ja;

  CategorySubTab({required this.notifyParent, required this.data, this.ja});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(
            thickness: 5.0,
            indent: 30,
            endIndent: 290,
            color: ja != null
                ? Colors.black
                : Theme.of(context).secondaryHeaderColor,
          ),
          SizedBox(
            height: 10.0,
          ),
          MVCategoryText(data[0]["_embedded"]["wp:term"][0][0]["name"],
              fontSize: 24.0,
              version: ja != null ? MVCTVersion.black : MVCTVersion.pink),
          SizedBox(height: 20.0),
          SizedBox(
            height: 875.0,
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 500,
                childAspectRatio: 1.05,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemCount: 6,
              itemBuilder: (context, i) => GestureDetector(
                onTap: () {
                  ja != null
                      ? Provider.of<MVP>(context, listen: false)
                          .enableJAView(data[i])
                      : Provider.of<MVP>(context, listen: false)
                          .enableReadView(data[i]);
                  notifyParent();
                },
                child: Center(
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
                      ClipRect(
                        child: SizedBox(
                          height: 100.0,
                          width: 250.0,
                          child: data[i]["title"]["rendered"]
                                      .toString()
                                      .length >
                                  60
                              ? Html(
                                  style: {
                                      "body": Style(
                                        margin: EdgeInsets.zero,
                                        padding: EdgeInsets.zero,
                                      )
                                    },
                                  data: "<h2>" +
                                      data[i]["title"]["rendered"]
                                          .toString()
                                          .substring(0, 60) +
                                      "..."
                                          "</h2>")
                              : Html(
                                  style: {
                                      "body": Style(
                                        margin: EdgeInsets.zero,
                                        padding: EdgeInsets.zero,
                                      )
                                    },
                                  data: "<h2>" +
                                      data[i]["title"]["rendered"].toString() +
                                      "</h2>"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
