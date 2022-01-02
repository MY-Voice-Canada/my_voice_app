import 'package:flutter/material.dart';
import 'package:my_voice_app/home/home_widget.dart';
import 'package:my_voice_app/models/loading.dart';
import 'package:my_voice_app/services/auth.dart';
import 'package:my_voice_app/welcome/form_decor.dart';
import 'package:provider/provider.dart';
import 'package:hexcolor/hexcolor.dart';

import '../main.dart';
import './splashscreen.dart';
import './login_row.dart';
import './register_form.dart';

class MVRegister extends StatefulWidget {
  @override
  State<MVRegister> createState() => _MVRegisterState();
}

class _MVRegisterState extends State<MVRegister> {
  bool _isLoading = false;

  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
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
        : Scaffold(
            resizeToAvoidBottomInset: false,
            body: Stack(
              children: [
                Positioned(
                  top: Provider.of<MVP>(context).screenHeightAppbarless / 20,
                  left: Provider.of<MVP>(context).screenWidth / 32,
                  child: TextButton(
                    onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MVSplashScreen())),
                    child: Text(
                      "<",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 48,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: OverflowBox(
                    maxWidth: Provider.of<MVP>(context).screenWidth * 2,
                    child: Container(
                      width: Provider.of<MVP>(context).screenWidth * 1.23,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            HexColor("FCB831").withOpacity(0.1),
                            HexColor("00B6B6").withOpacity(0.1),
                          ],
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: SizedBox(
                    height:
                        Provider.of<MVP>(context).screenHeightAppbarless / 0.75,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          LoginRow(signedIn: false, registered: true),
                          SizedBox(height: 20.0),
                          SizedBox(
                            height: Provider.of<MVP>(context)
                                    .screenHeightAppbarless /
                                2.5,
                            width: Provider.of<MVP>(context).screenWidth * 0.90,
                            child: Form(
                              key: _formKey,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextFormField(
                                      validator: (_) =>
                                          _nameController.text.isEmpty
                                              ? "Please enter your name!"
                                              : null,
                                      controller: _nameController,
                                      decoration: formDecoration.copyWith(
                                          hintText: "Name")),
                                  TextFormField(
                                      validator: (_) => !RegExp(
                                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                              .hasMatch(_emailController.text)
                                          ? "Please enter a valid email!"
                                          : null,
                                      controller: _emailController,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: formDecoration.copyWith(
                                          hintText: "Email")),
                                  TextFormField(
                                    validator: (_) => _passwordController
                                                .text.length <
                                            6
                                        ? "Please enter a password with at least 6 characters!"
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
                                    width:
                                        Provider.of<MVP>(context).screenWidth *
                                            0.90,
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                      color: HexColor("FCB831"),
                                      border: Border.all(color: Colors.grey),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
                                    ),
                                    child: TextButton(
                                      onPressed: () async {
                                        if (_formKey.currentState!.validate()) {
                                          setState(() {
                                            _isLoading = true;
                                          });
                                          dynamic user =
                                              await MVAuth.registerNEP(
                                                  _nameController.text,
                                                  _emailController.text,
                                                  _passwordController.text);
                                          if (user == null) {
                                            _isLoading = false;
                                            setState(() {
                                              _errorMessage =
                                                  "Could not register. Try again.";
                                            });
                                          } else
                                            Navigator.of(context)
                                                .pushReplacement(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
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
                          )
                        ]),
                  ),
                ),
              ],
            ),
          );
  }
}
