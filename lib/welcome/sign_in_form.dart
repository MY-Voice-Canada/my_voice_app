import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hexcolor/hexcolor.dart';

import '../main.dart';

class SIForm extends StatefulWidget {
  @override
  _SIFormState createState() => _SIFormState();
}

class _SIFormState extends State<SIForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  late bool _passwordVisible;

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  //TODO: test out using null ?? operand
  void _submitSI() {
    if (_emailController.text != "" && _passwordController.text != "") {
      Provider.of<MYVMProvider>(context).userEmail = _emailController.text;
      Provider.of<MYVMProvider>(context).userPassword =
          _passwordController.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Provider.of<MYVMProvider>(context).screenHeightAppbarless / 3.0,
      width: Provider.of<MYVMProvider>(context).screenWidth * 0.90,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: "E-mail",
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          TextField(
            controller: _passwordController,
            keyboardType: TextInputType.text,
            obscureText: !_passwordVisible,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: "Password",
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
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
            width: Provider.of<MYVMProvider>(context).screenWidth * 0.90,
            height: 60,
            decoration: BoxDecoration(
              color: HexColor("FCB831"),
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            child: TextButton(
              onPressed: _submitSI,
              child: Text(
                "Sign in",
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey[800],
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),
          ),
          Text("Forgot Password?"),
        ],
      ),
    );
  }
}
