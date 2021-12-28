import 'package:flutter/material.dart';
import 'package:my_voice_app/welcome/form_decor.dart';
import 'package:provider/provider.dart';
import 'package:hexcolor/hexcolor.dart';

import '../main.dart';
import '../home/home_widget.dart';

class RForm extends StatefulWidget {
  @override
  _RState createState() => _RState();
}

class _RState extends State<RForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  late bool _passwordVisible;
  bool _formCompleted = false;

  @override
  void initState() {
    _passwordVisible = false;
    _emailController.addListener(_formUpdated);
    _passwordController.addListener(_formUpdated);
    super.initState();
  }

  void _submitSI() {
    if (_nameController.text != "" &&
        _emailController.text != "" &&
        _passwordController.text != "") {
      Provider.of<MVProvider>(context, listen: false).userEmail =
          _emailController.text;
      Provider.of<MVProvider>(context, listen: false).userPassword =
          _passwordController.text;

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MVHome()));
    }
  }

  void _formUpdated() {
    setState(() {
      //print(this._formCompleted);
      if (_nameController.text != "" &&
          _emailController.text != "" &&
          _passwordController.text != "")
        this._formCompleted = true;
      else
        this._formCompleted = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Provider.of<MVProvider>(context).screenHeightAppbarless / 3.0,
      width: Provider.of<MVProvider>(context).screenWidth * 0.90,
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextFormField(
                controller: _nameController,
                decoration: formDecoration.copyWith(hintText: "Name")),
            TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: formDecoration.copyWith(hintText: "Email")),
            TextFormField(
              controller: _passwordController,
              keyboardType: TextInputType.text,
              obscureText: !_passwordVisible,
              decoration: formDecoration.copyWith(
                hintText: "Password",
                suffixIcon: IconButton(
                  icon: Icon(
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
              ),
            ),
            Container(
              width: Provider.of<MVProvider>(context).screenWidth * 0.90,
              height: 60,
              decoration: BoxDecoration(
                color: this._formCompleted
                    ? HexColor("FCB831")
                    : HexColor("FCB831").withOpacity(0.5),
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: TextButton(
                onPressed: this._formCompleted ? _submitSI : () {},
                child: Text(
                  "Create account",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: this._formCompleted
                        ? Colors.grey[800]
                        : Colors.grey[600],
                    fontWeight: FontWeight.w200,
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
