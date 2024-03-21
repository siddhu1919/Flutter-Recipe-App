// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _title(),
        _loginForm(),
      ],
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
          child: const Column(
        children: [
          TextField(),
          // SizedBox(
          //   height: 100,
          // ),
          TextField(),
        ],
      )),
    );
  }
}
