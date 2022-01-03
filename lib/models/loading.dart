import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_voice_app/models/background_image.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class MVLoading extends StatelessWidget {
  final String? message;

  MVLoading({this.message});

  @override
  Widget build(BuildContext context) {
    return MVBackground(
      child: Container(
        color: Theme.of(context).primaryColor.withOpacity(0.4),
        child: Stack(
          children: [
            Center(
              child: SpinKitFoldingCube(
                color: Colors.white,
                size: 250.0,
              ),
            ),
            if (message != null)
              Positioned(
                left: Provider.of<MVP>(context).screenWidth / 2 - 250,
                bottom: 120.0,
                child: Center(
                  child: SizedBox(
                    height: 100.0,
                    width: 500.0,
                    child: AutoSizeText(
                      message!,
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 36,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
