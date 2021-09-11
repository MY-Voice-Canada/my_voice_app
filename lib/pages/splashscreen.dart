import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import './sign_in.dart';
import './register.dart';

class SignInAndRegisterRow extends StatelessWidget {
  var signedIn;
  var registered;

  SignInAndRegisterRow({@required signedIn, @required registered}) {
    this.signedIn = signedIn;
    this.registered = registered;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: this.signedIn? () => {} : () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => MYVMASignIn())),
          child: Text(
            "Sign in",
            style: TextStyle(
              color: Theme.of(context)
                  .primaryColor
                  .withOpacity(this.signedIn? 0.5 : 1),
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
          onPressed: this.registered? () => {} : () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => MYVMARegister())),
          child: Text(
            "Register",
            style: TextStyle(
              color: Theme.of(context)
                  .primaryColor
                  .withOpacity(this.registered? 0.5 : 1),
              fontSize: Provider.of<MYVMProvider>(context).buttonFontSize,
            ),
          ),
        ),
      ],
    );
  }
}

class MYVMASplashScreen extends StatefulWidget {
  @override
  _MYVMASplashScreenState createState() => _MYVMASplashScreenState();
}

class _MYVMASplashScreenState extends State<MYVMASplashScreen> {
  @override
  Widget build(BuildContext context) {
    Provider.of<MYVMProvider>(context).screenHeightAppbarless =
        (MediaQuery.of(context).size.height -
            MediaQuery.of(context).padding.top);
    Provider.of<MYVMProvider>(context).screenWidth =
        MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
          child: Container(
        height: Provider.of<MYVMProvider>(context).screenHeightAppbarless,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset("assets/images/new_logo.png"),
            SignInAndRegisterRow(signedIn: false, registered: false,),
          ],
        ),
      )),
    );
  }
}
