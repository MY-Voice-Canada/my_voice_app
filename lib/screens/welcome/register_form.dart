import 'package:flutter/material.dart';
import 'package:my_voice_app/main.dart';
import 'package:my_voice_app/screens/welcome/form_decor.dart';
import 'package:my_voice_app/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:hexcolor/hexcolor.dart';

class RForm extends StatefulWidget {
  @override
  _RState createState() => _RState();
}

class _RState extends State<RForm> {
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
    return SizedBox(
      height: Provider.of<MVP>(context).screenHeightAppbarless / 2.5,
      width: Provider.of<MVP>(context).screenWidth * 0.90,
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextFormField(
                validator: (_) => _nameController.text.isEmpty
                    ? "Please enter your name!"
                    : null,
                controller: _nameController,
                decoration: formDecoration.copyWith(hintText: "Name")),
            TextFormField(
                validator: (_) =>
                    !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(_emailController.text)
                        ? "Please enter a valid email!"
                        : null,
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: formDecoration.copyWith(hintText: "Email")),
            TextFormField(
              validator: (_) => _passwordController.text.length < 6
                  ? "Please enter a password with at least 6 characters!"
                  : null,
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
            SizedBox(
              height: 10.0,
            ),
            Container(
              width: Provider.of<MVP>(context).screenWidth * 0.90,
              height: 60.0,
              decoration: BoxDecoration(
                color: HexColor("FCB831"),
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: TextButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    dynamic user = await MVAuth.registerNEP(
                        _nameController.text,
                        _emailController.text,
                        _passwordController.text);
                    if (user != null) {
                      Navigator.of(context).pushReplacementNamed("/home");
                    } else {
                      setState(() {
                        _errorMessage = "Could not register. Try again.";
                      });
                    }
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
              style: TextStyle(color: Colors.red, fontSize: 12.0),
            )
          ],
        ),
      ),
    );
  }
}
