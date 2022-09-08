import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class MagazineCard extends StatelessWidget {
  final String title;
  final String thumbnailImage;

  const MagazineCard(
      {Key? key, required this.title, required this.thumbnailImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image.network(this.thumbnailImage,
            loadingBuilder: (context, child, loadingProgress) =>
                loadingProgress == null
                    ? child
                    : Container(
                        width: double.infinity,
                        color: Colors.black12,
                        child: const Text("LOADING"),
                      )),
        Text(
          this.title,
          softWrap: true,
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
