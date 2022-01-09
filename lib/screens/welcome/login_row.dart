import 'package:flutter/material.dart';

class LoginRow extends StatelessWidget {
  final bool signedIn;
  final bool registered;
  final double? buttonSize;

  LoginRow({required this.signedIn, required this.registered, this.buttonSize});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: this.signedIn
              ? () => {}
              : () => Navigator.of(context).pushReplacementNamed("/signin"),
          child: Text(
            "Sign in",
            style: TextStyle(
              color: Theme.of(context)
                  .primaryColor
                  .withOpacity(this.signedIn ? 0.5 : 1),
              fontSize: buttonSize ?? 24,
              fontWeight: FontWeight.bold,
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
              : () => Navigator.of(context).pushReplacementNamed("/register"),
          child: Text(
            "Register",
            style: TextStyle(
              color: Theme.of(context)
                  .primaryColor
                  .withOpacity(this.registered ? 0.5 : 1),
              fontSize: buttonSize ?? 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
