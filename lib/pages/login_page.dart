// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:social_login_buttons/social_login_buttons.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        // centerTitle: true,
        title: Text(
          "Login",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: SafeArea(child: _buildUI()),
    );
  }

  Widget _buildUI() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _title(),
          _loginForm(),
        ],
      ),
    );
  }

  Widget _title() {
    return Center(
      child: Text(
        "R E C I P E",
        style: TextStyle(
          height: 1.5,
          fontSize: 40,
          fontWeight: FontWeight.w900,
          color: Colors.deepPurpleAccent,
        ),
      ),
    );
  }

  Widget _loginForm() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.90,
      height: MediaQuery.sizeOf(context).height * 0.30,
      child: Form(
          child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            decoration: InputDecoration(hintText: "Username"),
          ),
          TextFormField(
            obscureText: _isObscure,
            decoration: InputDecoration(
              hintText: "Password",
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
                icon: Icon(
                  _isObscure ? Icons.visibility : Icons.visibility_off,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 35,
          ),
          _loginButton(),
          SizedBox(
            height: 30,
            child: Text(
              "Or",
              style: TextStyle(
                color: Colors.deepPurpleAccent,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          _socialButtons(),
        ],
      )),
    );
  }

  Widget _loginButton() {
    return SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.60,
        child: ElevatedButton(
            style: ButtonStyle(
              shadowColor: MaterialStateProperty.all(Colors.deepPurpleAccent),
              elevation: MaterialStateProperty.all(10),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              backgroundColor:
                  MaterialStateProperty.all(Colors.deepPurpleAccent),
            ),
            onPressed: () {},
            child: const Text(
              "Login",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            )));
  }

  // TODO:Create me a widget for google facebook and github login buttons.
  Widget _socialButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SocialLoginButton(
          buttonType: SocialLoginButtonType.google,
          onPressed: () {},
        ),
      ],
    );
  }

  // TODO:Create me a widget for the create account button.

  // TODO:Create me a widget for the forgot password button.
}
