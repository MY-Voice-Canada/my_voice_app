import 'package:flutter/material.dart';

typedef Redirect = void Function();

class ContinuedHeading extends StatelessWidget {
  final String title;
  final Color textColor;
  final Color accentColor;
  final Redirect redirect;

  const ContinuedHeading(
      {Key? key,
      required this.title,
      required this.redirect,
      this.textColor = Colors.black,
      this.accentColor = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(this.title,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: this.textColor)),
              GestureDetector(
                onTap: this.redirect,
                child: Row(
                  children: [
                    Text("View All",
                        style: TextStyle(fontSize: 16, color: this.textColor)),
                    Icon(
                      Icons.chevron_right_rounded,
                      color: this.accentColor,
                    )
                  ],
                ),
              )
            ]),
        ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Container(height: 3, width: 64, color: this.accentColor))
      ],
    );
  }
}
