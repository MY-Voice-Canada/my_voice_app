import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:responsive_framework/responsive_framework.dart';

class FourTileCategory extends StatelessWidget {
  final String categoryName;

  FourTileCategory(this.categoryName);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(10),
                  child: Text(
                    categoryName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'View All >',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.pink[300],
                    ),
                  ),
                )
              ],
            ),
          ),
          Card(
            margin: EdgeInsets.all(0),
            child: Row(
              children: <Widget>[
                Container(
                    width: 100,
                    height: 60,
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 5,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                        width: 2,
                      ),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Image.asset('logo_icon.png')),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'author',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.pink[300],
                      ),
                    ),
                    Text(
                      'This is the title of this neat article',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
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