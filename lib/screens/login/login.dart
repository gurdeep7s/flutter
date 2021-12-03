import 'dart:convert';
import 'dart:ffi';

import 'package:demo_app/getit/locator.dart';
import 'package:demo_app/screens/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  LoginBloc bloc  = locator.get<LoginBloc>();




@override
  void dispose() {
    // TODO: implement dispose
  bloc.dispose();
  super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text("Home"),
        //   centerTitle: true,
        // ),
        body: SingleChildScrollView(
          child: Column(
      children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(14.0),
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              alignment: Alignment.center,
                              child: const Image(
                                image: AssetImage('assets/splash_logo.jpg'),
                                height: 100,
                                width: 100,
                              )),
                          const Text(
                            "Login",
                            style: TextStyle(
                              color: Color(0xff275C2E),
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          )
                        ]),
                  ),
                  StreamBuilder(
                    stream: bloc.emailStream,
                    builder:
                        (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                      return Container(
                        color: Colors.transparent,
                        margin: const EdgeInsets.only(top: 10),
                        child: TextField(
                          onChanged: (text) {
                            bloc.emailSink.add(text);
                          },
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                              fillColor: Colors.grey,
                              labelText: "Email",
                              labelStyle:  TextStyle(
                                  color: snapshot.hasError? Colors.red:const Color(0xff275C2E)
                              ),

                              focusedErrorBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(14)),
                                  borderSide: BorderSide(
                                    color: Colors.red,

                                  )),
                              errorBorder: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(14)),
                              borderSide: BorderSide(
                                color: Colors.red,

                              )),
                              errorText: snapshot.hasError
                                  ? snapshot.error.toString()
                                  : null,

                              focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(14)),
                                  borderSide: BorderSide(
                                    color: Color(0xff275C2E),
                                  )),
                              enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(14)),
                                  borderSide: BorderSide(color: Colors.grey))),

                        ),
                      );
                    },
                  ),
                  StreamBuilder(
                      stream: bloc.passStream,
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        return Container(
                          margin: const EdgeInsets.only(top: 20),
                          child: TextField(
                            onChanged: (text) {
                              bloc.passSink.add(text);
                            },
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                            decoration:  InputDecoration(
                                labelText: "Password",
                                labelStyle:  TextStyle(
                                    color: snapshot.hasError? Colors.red:const Color(0xff275C2E)
                                ),
                                // hintText: "Enter password",
                                fillColor: Colors.grey,
                                errorText: snapshot.hasError
                                    ? snapshot.error.toString()
                                    : null,
                                focusedErrorBorder: const OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(14)),
                                    borderSide: BorderSide(
                                      color: Colors.red,

                                    )),
                                errorBorder: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(14)),
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                    )),
                                focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(14)),
                                  borderSide:
                                      BorderSide(color: Color(0xff275C2E)),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(14)),
                                    borderSide: BorderSide(color: Colors.grey))),
                          ),
                        );
                      }),
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                              height: 24.0,
                              width: 24.0,
                              child:
                                  Checkbox(value: false, onChanged: (value) {})),

                          SizedBox(width: 5.0),
                          Text("Remember me")
                        ]),
                  ),
                  StreamBuilder(
                      stream: bloc.isValid,
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        return Container(
                          margin: const EdgeInsets.only(top: 20, bottom: 20),
                          child: ElevatedButton(
                            onPressed: () {

                                  bloc.eventSink.add(LoginEvent.LoginAction);

                            },
                            style: ElevatedButton.styleFrom(
                                primary: Color(0xff275C2E),
                                minimumSize: const Size.fromHeight(50),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0))),
                            child: const Text('Login'),
                          ),
                        );
                      }),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: const Text(
                      'New User? Sign up here',
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  )
                ],
              ),
            ),
          )
      ],
    ),
        ));
  }
}
