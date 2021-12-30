import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import './sign_in.dart';
import './register.dart';

class LoginRow extends StatelessWidget {
  bool signedIn;
  bool registered;
  double? buttonSize;

  LoginRow({required this.signedIn, required this.registered, this.buttonSize});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: this.signedIn
              ? () => {}
              : () => Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => MVSignIn())),
          child: Text(
            "Sign in",
            style: TextStyle(
              color: Theme.of(context)
                  .primaryColor
                  .withOpacity(this.signedIn ? 0.5 : 1),
              fontSize: buttonSize ?? 24,
            ),
          ),
        ),
        Text(
          " | ",
          style: TextStyle(
            fontSize: buttonSize ?? 24,
          ),
        ),
        TextButton(
          onPressed: this.registered
              ? () => {}
              : () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => MVRegister())),
          child: Text(
            "Register",
            style: TextStyle(
              color: Theme.of(context)
                  .primaryColor
                  .withOpacity(this.registered ? 0.5 : 1),
              fontSize: buttonSize ?? 24,
            ),
          ),
        ),
      ],
    );
  }
}
