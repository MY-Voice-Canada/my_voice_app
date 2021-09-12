import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import './sign_in.dart';
import './register.dart';

class LoginRow extends StatelessWidget {
  var signedIn;
  var registered;

  LoginRow({@required signedIn, @required registered}) {
    this.signedIn = signedIn;
    this.registered = registered;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: this.signedIn
              ? () => {}
              : () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => MYVMASignIn())),
          child: Text(
            "Sign in",
            style: TextStyle(
              color: Theme.of(context)
                  .primaryColor
                  .withOpacity(this.signedIn ? 0.5 : 1),
              fontSize: Provider.of<MYVMProvider>(context).buttonFontSize,
            ),
          ),
        ),
        Text(
          " | ",
          style: TextStyle(
            fontSize: Provider.of<MYVMProvider>(context).buttonFontSize,
          ),
        ),
        TextButton(
          onPressed: this.registered
              ? () => {}
              : () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => MYVMARegister())),
          child: Text(
            "Register",
            style: TextStyle(
              color: Theme.of(context)
                  .primaryColor
                  .withOpacity(this.registered ? 0.5 : 1),
              fontSize: Provider.of<MYVMProvider>(context).buttonFontSize,
            ),
          ),
        ),
      ],
    );
  }
}