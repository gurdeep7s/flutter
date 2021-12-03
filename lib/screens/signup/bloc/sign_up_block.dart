import 'dart:async';

import 'package:demo_app/getit/locator.dart';
import 'package:demo_app/screens/signup/model/signup_response_model.dart';
import 'package:demo_app/screens/signup/repo/signup_web_repo.dart';
import 'package:demo_app/validations/validator_class.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rxdart/rxdart.dart';

enum SignUpEvent { SIGNUP }

class SignupBloc with ValidatorClass {
  final BehaviorSubject<SignUpEvent> event = BehaviorSubject<SignUpEvent>();
  final BehaviorSubject<String> _name = BehaviorSubject<String>();
  BehaviorSubject<String> _email = BehaviorSubject<String>();
  BehaviorSubject<String> _password = BehaviorSubject<String>();
  BehaviorSubject<String> _confirmPassword = BehaviorSubject<String>();
  BehaviorSubject<bool> _isLoading = BehaviorSubject<bool>();

  //Loader
  StreamSink<bool> get isLoaderSink => _isLoading.sink;
  Stream<bool> get isLoaderStream => _isLoading.stream;
  // setter
  StreamSink<String> get nameSink => _name.sink;

  StreamSink<String> get emailSink => _email.sink;

  StreamSink<String> get passwordSink => _password.sink;

  StreamSink<String> get confirmdSink => _confirmPassword.sink;

  // getter
  Stream<String> get nameStream => _name.stream.transform(nameValidation);

  Stream<String> get emailStream => _email.stream.transform(emailValidator);


  Stream<String> get passwordStream =>
      _password.stream.transform(passValidator);

  Stream<String> get confirmStream =>
      _confirmPassword.stream.transform(passValidator);

  Stream<SignUpEvent> get eventStream => event.stream;

  StreamSink<SignUpEvent> get eventSink => event.sink;

  //event

  SignupBloc() {
    SignupWebRepo api = locator.get<SignupWebRepo>();
    eventStream.listen((event) async {
      if (event == SignUpEvent.SIGNUP) {
        if (!_name.hasValue) {
          showToast("Please enter full name");
          return;
        } else if (!_email.hasValue) {
          showToast("Please enter email address");
          return;
        } else if (!_email.value.contains("@") || !_email.value.contains(".")) {
          showToast("Please enter valid email address");
          return;
        } else if (!_password.hasValue) {
          showToast("Please enter password");
          return;
        } else if (_password.value.length < 5) {
          showToast("Password should be atleast of 5 digits");
          return;
        } else if (_password.value != _confirmPassword.value) {
          showToast("Confirm password should match with password");
          return;
        }
        SignupResponseModel res =
            await api.registerUser(_name.value, _email.value, _password.value);
        if (res.code == 201) {
          showToast(res.message!);
        } else {
          showToast(res.message!);
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
    _name.close();
    _email.close();
    _password.close();
    _confirmPassword.close();
    event.close();
  }
}
