import 'package:flutter/material.dart';
import 'login.dart';

void main() => runApp(MaterialApp(
      title: "Login",
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: Login(),
      ),
    ));
