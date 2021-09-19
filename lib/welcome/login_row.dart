import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import './sign_in.dart';
import './register.dart';

class LoginRow extends StatelessWidget {
  bool signedIn;

  LoginRow({required this.signedIn});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: signedIn
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
          onPressed: this.signedIn
              ? () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => MYVMARegister()))
              : () => {},
          child: Text(
            "Register",
            style: TextStyle(
              color: Theme.of(context)
                  .primaryColor
                  .withOpacity(this.signedIn? 1 : 0.5),
              fontSize: Provider.of<MYVMProvider>(context).buttonFontSize,
            ),
          ),
        ),
      ],
    );
  }
}
