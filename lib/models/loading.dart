import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_voice_app/models/background_image.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class MVLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MVBackground(
      child: Container(
        color: Theme.of(context).primaryColor.withOpacity(0.4),
        child: Center(
          child: SpinKitFoldingCube(
            color: Colors.white,
            size: 250.0,
          ),
        ),
      ),
    );
  }
}
