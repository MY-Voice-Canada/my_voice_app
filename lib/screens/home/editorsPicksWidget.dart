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
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
                      child: Text(
                        'Title of the Big Article',
                        textAlign: TextAlign.left,
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
                      child: Text(
                        'Little Summary of Big Pic',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 13,
                          color: HexColor('000000'),
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
                      children: [
                        Container(
                          height: 100,
                          width: 175,
                          child: Card(
                            child: Image.asset('assets/images/logo.png'),
                            margin: EdgeInsets.all(10),
                          ),
                        ),
                        Text(
                          'Category',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 11,
                            color: HexColor('F5416C'),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Smoll Title',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: HexColor('000000'),
                            ),
                          ),
                        ),
                        Text(
                          'Little Summary of small Pic',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 10,
                            color: HexColor('000000'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: null,
                    child: Column(
                      children: [
                        Container(
                          height: 100,
                          width: 175,
                          child: Card(
                            child: Image.asset('assets/images/logo.png'),
                            margin: EdgeInsets.all(10),
                          ),
                        ),
                        Text(
                          'Category',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 11,
                            color: HexColor('F5416C'),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Smoll Title',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: HexColor('000000'),
                            ),
                          ),
                        ),
                        Text(
                          'Little Summary of small Pic',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 10,
                            color: HexColor('000000'),
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
