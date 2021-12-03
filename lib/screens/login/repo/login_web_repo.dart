import 'dart:convert';

import 'package:demo_app/screens/login/model/login_response_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class LoginWebRepo{


   Future<LoginResponseModel>  loginUser( String email, String password) async {
      var res = await http
          .post(Uri.parse("http://192.168.18.67:3300/api/login"), body: {
        "email": email,
        "password": password
      }, headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      });

      debugPrint("####"+"$email   $password "+res.body.toString());
      final Map parsed = json.decode(res.body);

      return LoginResponseModel.fromJson(parsed);

      }


    }

