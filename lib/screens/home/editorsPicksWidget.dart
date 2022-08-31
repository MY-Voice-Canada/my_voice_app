import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hexcolor/hexcolor.dart';

class EditorsPicks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      // from here begins the 3 boxes under 'editors picks' text
      children: [
        Card(
          margin: EdgeInsets.zero,
          child: Column(
            children: [
              GestureDetector(
                onTap: null,
                child: Column(
                  children: [
                    Container(
                      width: 400,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
                      child: Text(
                        'Title of the Big Article (wraps)',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: HexColor('000000'),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                      child: Text(
                        'Category',
                        style: TextStyle(
                          fontSize: 14,
                          color: HexColor('F5416C'),
                        ),
                      ),
                    ),
                    Container(
                      height: 200,
                      width: 400,
                      child: Card(
                        child: Image.asset('assets/images/logo.png'),
                        margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                      child: Container(
                        width: 400,
                        margin: EdgeInsets.only(left: 5),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Little Summary of Big Pic (wraps)',
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 13,
                            color: HexColor('000000'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: null,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 100,
                          width: 175,
                          child: Card(
                            child: Image.asset('assets/images/logo.png'),
                            margin: EdgeInsets.all(10),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 0, 5),
                          child: Text(
                            'Category',
                            style: TextStyle(
                              fontSize: 11,
                              color: HexColor('F5416C'),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 5),
                          child: Text(
                            'Smoll Title'.length > 20
                                ? 'Smoll Title'.substring(0, 10) + '...'
                                : 'Smoll Title',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: HexColor('000000'),
                            ),
                          ),
                        ),
                        Container(
                          width: 175,
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 5),
                          child: Text(
                            'Little Summary of small Pic. YES THE CONTAINER WRAPS',
                            maxLines: 2,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 10,
                              color: HexColor('000000'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
