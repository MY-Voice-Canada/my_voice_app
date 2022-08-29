import 'package:flutter/material.dart';

class ContinuedHeading extends StatelessWidget {
  final String title;
  final String href;
  final Color textColor;
  final Color accentColor;

  const ContinuedHeading(
      {Key? key,
      required this.title,
      required this.href,
      this.textColor = Colors.black,
      this.accentColor = Colors.black})
      : super(key: key);

  redirect(BuildContext context) {
    // TODO implementation for redirecting user
    return () => Navigator.pushNamed(context, this.href);
  }

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
                onTap: redirect(context),
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
