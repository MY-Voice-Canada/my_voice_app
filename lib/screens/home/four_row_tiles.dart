import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:my_voice_app/main.dart';
import 'package:provider/provider.dart';

class FourTileCategory extends StatelessWidget {
  final Function notifyParent;
  final String cardColor;
  final bool? ja;
  final bool? vid;
  late final dynamic data;

  FourTileCategory(
      {required this.data,
      required this.cardColor,
      required this.notifyParent,
      this.vid,
      this.ja});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    var smallText = [21.0, 12.0, 23.0, 13.0, 16.0];
    var bigText = [35.0, 24.0, 30.0, 18.0, 28.0];
    var simageDimensions = [65.0, 95.0];
    var limageDimensions = [95.0, 155.0];

    return Column(
      children: [
        if (screenWidth < 625)
          (fourTiles(context, smallText, simageDimensions)),
        if (screenWidth > 625) (fourTiles(context, bigText, limageDimensions)),
      ],
    );
  }

  Widget fourTiles(BuildContext context, var fontSize, var imageSize) {
    return Container(
      margin: EdgeInsets.zero,
      child: Column(
        children: [
          Card(
            margin: EdgeInsets.zero,
            color: HexColor(cardColor),
            elevation: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    this.ja == true
                        ? data[0]["_embedded"]["wp:term"][0][0]["name"]
                            .toString()
                            .substring(11)
                        : data[0]["_embedded"]["wp:term"][0][0]["name"],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: fontSize[0],
                      color: HexColor('000000'),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: null,
                  child: Container(
                    margin: EdgeInsets.all(5),
                    child: Row(
                      children: [
                        // Text(
                        //   'View All ',
                        //   style: TextStyle(
                        //     fontWeight: FontWeight.bold,
                        //     fontSize: fontSize[1],
                        //     color: HexColor('000000'),
                        //   ),
                        // ),
                        // Container(
                        //   margin: EdgeInsets.only(bottom: 5),
                        //   child: Text(
                        //     ' >',
                        //     style: TextStyle(
                        //       fontSize: fontSize[2],
                        //       color: HexColor('F5416C'),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          for (var i = 0; i < 6; i++)
            (GestureDetector(
              onTap: () {
                ja != null
                    ? Provider.of<MVP>(context, listen: false)
                        .enableJAView(data[i])
                    : Provider.of<MVP>(context, listen: false)
                        .enableReadView(data[i]);
                notifyParent();
              },
              child: Card(
                margin: EdgeInsets.zero,
                color: HexColor(cardColor),
                elevation: 0,
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: this.ja == true
                              ? HexColor("1BCFC9")
                              : HexColor('F5416C'),
                          width: 2,
                        ),
                      ),
                      padding: EdgeInsets.all(5),
                      child: Container(
                        height: imageSize[0],
                        width: imageSize[1],
                        child: Image.network(
                          data[i]["_embedded"]["wp:featuredmedia"][0]
                              ["source_url"],
                          fit: BoxFit.fill,
                        ), //ARTICLE IMAGE
                      ),
                    ),
                    Container(
                      width: Provider.of<MVP>(context).screenWidth / 1.6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                            child: Text(
                              // ARTICLE AUTHOR
                              data[i]["_embedded"]["author"][0]["name"],
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: fontSize[3],
                                color: this.ja == true
                                    ? HexColor("1BCFC9")
                                    : HexColor('F5416C'),
                              ),
                            ),
                          ),
                          SizedBox(
                            child: Text(
                              // ARTICLE TITLE
                              data[i]["title"]["rendered"]
                                          .toString()
                                          .replaceAll(RegExp("&amp;"), '&')
                                          .replaceAll(RegExp("&#038;"), '&')
                                          .replaceAll(RegExp("&#39;"), '\'')
                                          .replaceAll("&#8217;", '\'')
                                          .replaceAll("&#8211;", '–')
                                          .length >
                                      60
                                  ? data[i]["title"]["rendered"]
                                          .toString()
                                          .replaceAll(RegExp("&amp;"), '&')
                                          .replaceAll(RegExp("&#038;"), '&')
                                          .replaceAll(RegExp("&#39;"), '\'')
                                          .replaceAll("&#8217;", '\'')
                                          .replaceAll("&#8211;", '–')
                                          .substring(
                                              0,
                                              data[i]["title"]["rendered"]
                                                          .toString()
                                                          .replaceAll(
                                                              RegExp("&amp;"),
                                                              '&')
                                                          .replaceAll(
                                                              RegExp("&#038;"),
                                                              '&')
                                                          .replaceAll(
                                                              RegExp("&#39;"),
                                                              '\'')
                                                          .replaceAll(
                                                              "&#8217;", '\'')
                                                          .replaceAll("&#8211;",
                                                              '–')[49] ==
                                                      ' '
                                                  ? 59
                                                  : 60) +
                                      '...'
                                  : data[i]["title"]["rendered"]
                                      .toString()
                                      .replaceAll(RegExp("&amp;"), '&')
                                      .replaceAll(RegExp("&#038;"), '&')
                                      .replaceAll(RegExp("&#39;"), '\'')
                                      .replaceAll("&#8217;", '\'')
                                      .replaceAll("&#8211;", '–'),
                              maxLines: 2,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: fontSize[4],
                                color: HexColor('000000'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
        ],
      ),
    );
  }
}
// class FourTileCategory extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       builder: (context, widget) => ResponsiveWrapper.builder(
//         ClampingScrollWrapper.builder(context, widget!),
//         breakpoints: const[
//           ResponsiveBreakpoint.resize(350, name: MOBILE),
//           ResponsiveBreakpoint.autoScale(600, name: TABLET),
//           ResponsiveBreakpoint.resize(800, name: DESKTOP),
//           ResponsiveBreakpoint.autoScale(1700, name: 'XL')
//         ],
//       ),
//     );
//   }
// }

// ResponsiveRowColumn(
//   rowMainAxisAlignment: MainAxisAlignment.center,
//   rowPadding: const EdgeInsets.all(30),
//   columnPadding: const EdgeInsets.all(30),
//   layout: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
//   ? ResponsiveRowColumnType.COLUMN //if its smaller than DESKTOP make it a Column
//   : ResponsiveRowColumnType.ROW, //else make it a ROW

//   children: [
//     ResponsiveRowColumnItem(
//       rowFlex: 1,
//       child: CourseTile(Course: courses[0]),
//     ),
//   ],

// ),
