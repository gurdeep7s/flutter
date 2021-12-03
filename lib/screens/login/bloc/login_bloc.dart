import 'dart:async';
import 'dart:convert';

import 'package:demo_app/getit/locator.dart';
import 'package:demo_app/screens/login/model/login_response_model.dart';
import 'package:demo_app/screens/login/repo/login_web_repo.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rxdart/rxdart.dart';
import 'package:demo_app/validations/validator_class.dart';

enum LoginEvent { LoginAction, SignUpAction }

class LoginBloc with ValidatorClass {
  BehaviorSubject<String> _emailController = BehaviorSubject<String>();
  //loader
  BehaviorSubject<bool> _isLoading = BehaviorSubject<bool>();
  StreamSink<bool> get isLoaderSink => _isLoading.sink;
  Stream<bool> get isLoaderStream => _isLoading.stream;

  StreamSink<String> get emailSink => _emailController.sink;

  Stream<String> get emailStream => _emailController.stream.transform(emailValidator);

  final _passController = BehaviorSubject<String>();

  StreamSink<String> get passSink => _passController.sink;

  Stream<String> get passStream => _passController.stream.transform(passValidator);

  final _eventController = BehaviorSubject<LoginEvent>();

  StreamSink<LoginEvent> get eventSink => _eventController.sink;

  Stream<LoginEvent> get eventStream => _eventController.stream;

  Stream<bool> get isValid =>
      Rx.combineLatest2(emailStream, passStream, (a, b) => true);

  LoginBloc() {
    LoginWebRepo api = locator.get<LoginWebRepo>();
    eventStream.listen((event) async {
      if (event == LoginEvent.LoginAction) {
        if (!_emailController.hasValue) {
          showToast("Please enter email address");
          return;
        } else if (!_emailController.value.toString().contains("@") ||
            !_emailController.value.toString().contains(".")) {
          showToast("Please enter valid email address");
          return;
        } else if (!_passController.hasValue) {
          showToast("Please enter password");

          return;
        } else if (_passController.value.toString().length < 5) {
          showToast("Password should be atleast of 5 digits");
          return;
        }
        LoginResponseModel res = await api.loginUser(_emailController.value.toString(),
            _passController.value.toString());

        if (res.code == 201) {

          showToast(res.message);

         // debugPrint("Res : " + jsonDecode(res.body)['message']);

        } else {
          showToast(res.message);

          //debugPrint("Res : " + jsonDecode(res.body)['message']);
        }
      }
    });
  }

  showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  dispose() {
    _passController.close();
    _emailController.close();
    _eventController.close();

  }
}
