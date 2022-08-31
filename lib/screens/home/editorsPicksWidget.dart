import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hexcolor/hexcolor.dart';

class EditorsPicks extends StatelessWidget {
  late final dynamic data;

  EditorsPicks(this.data);

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
                        data[0]["title"]["rendered"].toString(),
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
                        data[0]["_embedded"]["wp:term"][0][0]["name"],
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
                        child: Image.network(
                          data[0]["_embedded"]["wp:featuredmedia"][0]
                              ["source_url"],
                          fit: BoxFit.fill,
                        ),
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
                          data[0]["content"]["rendered"],
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
                            child: Image.network(
                              data[1]["_embedded"]["wp:featuredmedia"][0]
                                  ["source_url"],
                              fit: BoxFit.fill,
                            ),
                            margin: EdgeInsets.all(10),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 0, 5),
                          child: Text(
                            data[1]["_embedded"]["wp:term"][0][0]["name"],
                            style: TextStyle(
                              fontSize: 11,
                              color: HexColor('F5416C'),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 5),
                          child: Text(
                            data[1]["title"]["rendered"].toString().length > 20
                                ? data[1]["title"]["rendered"]
                                        .toString()
                                        .substring(0, 10) +
                                    '...'
                                : data[1]["title"]["rendered"].toString(),
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
                            data[1]["content"]["rendered"],
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
