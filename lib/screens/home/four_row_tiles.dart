import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:responsive_framework/responsive_framework.dart';

class FourTileCategory extends StatelessWidget {
  final String cardColor;

  late final dynamic data;

  FourTileCategory({required this.data, required this.cardColor});

  @override
  Widget build(BuildContext context) {
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
                    data[0]["_embedded"]["wp:term"][0][0]["name"].length > 25
                        ? data[0]["_embedded"]["wp:term"][0][0]["name"]
                                .substring(0, 10) +
                            '...'
                        : data[0]["_embedded"]["wp:term"][0][0]["name"],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 21,
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
                        Text(
                          'View All ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: HexColor('000000'),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 5),
                          child: Text(
                            ' >',
                            style: TextStyle(
                              fontSize: 23,
                              color: HexColor('F5416C'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          // ListView(
          //   children: [
          //     for (var i = 0; i < 4; i++)
          GestureDetector(
            onTap: null,
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
                        color: Theme.of(context).primaryColor,
                        width: 2,
                      ),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Container(
                      height: 30,
                      width: 60,
                      child: Image.network(
                        data[0]["_embedded"]["wp:featuredmedia"][0]
                            ["source_url"],
                        fit: BoxFit.fill,
                      ), //ARTICLE IMAGE
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        // ARTICLE AUTHOR
                        data[0]["_embedded"]["author"][0]["name"],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 9,
                          color: HexColor('F5416C'),
                        ),
                      ),
                      Text(
                        // ARTICLE TITLE
                        data[0]["title"]["rendered"].toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: HexColor('000000'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      //   ],
      // ),
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