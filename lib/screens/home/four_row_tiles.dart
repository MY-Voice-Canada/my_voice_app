import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:responsive_framework/responsive_framework.dart';

class FourTileCategory extends StatelessWidget {
  final String categoryName;
  final String cardColor;

  FourTileCategory(this.categoryName, this.cardColor);

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
                    categoryName,
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
                    margin: EdgeInsets.all(10),
                    child: Text(
                      'View All >',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: HexColor('F5416C'),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
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
                      child: Image.asset('assets/images/logo.png'),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Anon Writer',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 9,
                          color: HexColor('F5416C'),
                        ),
                      ),
                      Text(
                        'The Writing Style of William',
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