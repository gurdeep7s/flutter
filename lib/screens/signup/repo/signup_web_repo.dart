
import 'dart:convert';

import 'package:demo_app/screens/login/model/login_response_model.dart';
import 'package:demo_app/screens/signup/model/signup_response_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
class SignupWebRepo{

  Future<SignupResponseModel>  registerUser( String name, String email, String password) async {
    var res = await http
        .post(Uri.parse("http://192.168.18.67:3300/api/register"), body: {
      "email": email,
      "name": name,
      "password": password,

    }, headers: {
      "Content-Type": "application/x-www-form-urlencoded",
    });

    debugPrint("####"+"$email   $password "+res.body.toString());
    final Map parsed = json.decode(res.body);

    return SignupResponseModel.fromJson(parsed);

  }


}