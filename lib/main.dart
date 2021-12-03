import 'dart:developer';
import 'dart:math';

import 'package:demo_app/getit/locator.dart';
import 'package:demo_app/home.dart';

import 'package:demo_app/screens/login/login.dart';
import 'package:demo_app/screens/signup/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  setup();
  runApp(MaterialApp(debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => Login(),
        '/signup': (context) => Signupp(),
        '/home': (context) => Home()
      }
     // home: Login()
  ));
}



// class Login extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//
//   }
// }
