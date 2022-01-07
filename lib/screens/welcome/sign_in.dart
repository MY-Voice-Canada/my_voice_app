import 'package:flutter/material.dart';
import 'package:my_voice_app/main.dart';
import 'package:my_voice_app/models/background_image.dart';
import 'package:my_voice_app/models/loading.dart';
import 'package:my_voice_app/screens/home/home_widget.dart';
import 'package:my_voice_app/screens/welcome/form_decor.dart';
import 'package:my_voice_app/screens/welcome/login_row.dart';
import 'package:my_voice_app/screens/welcome/splashscreen.dart';
import 'package:my_voice_app/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:hexcolor/hexcolor.dart';

class MVSignIn extends StatefulWidget {
  @override
  State<MVSignIn> createState() => _MVSignInState();
}

class _MVSignInState extends State<MVSignIn> {
  bool _isLoading = false;

  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  late bool _passwordVisible;

  String _errorMessage = "";

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? MVLoading()
        : MVBackground(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              resizeToAvoidBottomInset: false,
              body: Stack(
                children: [
                  Center(
                    child: OverflowBox(
                      maxWidth: Provider.of<MVP>(context).screenWidth * 1.2,
                      child: Container(
                        width: Provider.of<MVP>(context).screenWidth * 1.1,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      height: Provider.of<MVP>(context).screenHeightAppbarless /
                          0.75,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          LoginRow(signedIn: true, registered: false),
                          SizedBox(height: 20),
                          Stack(
                            children: [
                              SizedBox(
                                height: Provider.of<MVP>(context)
                                        .screenHeightAppbarless /
                                    3.0,
                                width: Provider.of<MVP>(context).screenWidth *
                                    0.90,
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextFormField(
                                          validator: (_) => !RegExp(
                                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                                  .hasMatch(
                                                      _emailController.text)
                                              ? "Please enter a valid email!"
                                              : null,
                                          controller: _emailController,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: formDecoration.copyWith(
                                              hintText: "Email")),
                                      TextFormField(
                                        validator: (_) =>
                                            _passwordController.text.isEmpty
                                                ? "Please enter a password!"
                                                : null,
                                        controller: _passwordController,
                                        keyboardType: TextInputType.text,
                                        obscureText: !_passwordVisible,
                                        decoration: formDecoration.copyWith(
                                          hintText: "Password",
                                          suffixIcon: IconButton(
                                            icon: Icon(
                                              _passwordVisible
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                _passwordVisible =
                                                    !_passwordVisible;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Container(
                                        width: Provider.of<MVP>(context)
                                                .screenWidth *
                                            0.90,
                                        height: 60.0,
                                        decoration: BoxDecoration(
                                          color: HexColor("FCB831"),
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50)),
                                        ),
                                        child: TextButton(
                                          onPressed: () async {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              setState(() {
                                                _isLoading = true;
                                              });
                                              dynamic user =
                                                  await MVAuth.signInEP(
                                                      _emailController.text,
                                                      _passwordController.text);
                                              if (user == null) {
                                                _isLoading = false;
                                                setState(() {
                                                  _errorMessage =
                                                      "Could not sign in. Please try again.";
                                                });
                                              } else
                                                Navigator.of(context)
                                                    .pushReplacement(
                                                        MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    MVHome()));
                                            }
                                          },
                                          child: Text(
                                            "Create account",
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.grey[800],
                                              fontWeight: FontWeight.w200,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        _errorMessage,
                                        style: TextStyle(
                                            color: Colors.red, fontSize: 12.0),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MVSplashScreen())),
                            child: Text(
                              "← Go Back",
                              style: TextStyle(
                                color: Theme.of(context).secondaryHeaderColor,
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
