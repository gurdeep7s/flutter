import 'package:demo_app/getit/locator.dart';
import 'package:demo_app/screens/signup/bloc/sign_up_block.dart';
import 'package:flutter/material.dart';

class Signupp extends StatelessWidget {
  SignupBloc bloc = locator.get<SignupBloc>();


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14.0),
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height / 3,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Image(
                        image: AssetImage('assets/splash_logo.jpg'),
                        height: 120,
                        width: 120,
                      ),
                      Text('Sign up',
                          style: TextStyle(
                              fontSize: 24,
                              color: Color(0xff275C2E),
                              fontWeight: FontWeight.bold))
                    ]),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    StreamBuilder<String>(
                        stream: bloc.nameStream,
                        builder: (context, snapshot) {
                          return TextField(
                            onChanged: (text) => bloc.nameSink.add(text),
                            decoration: InputDecoration(
                                labelText: "FullName",
                                focusedErrorBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(14)),
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                    )),
                                errorBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(14)),
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
                                    borderSide:
                                        BorderSide(color: Colors.grey))),
                          );
                        }),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      child: StreamBuilder<String>(
                          stream: bloc.emailStream,
                          builder: (context, snapshot) {
                            return TextField(
                              onChanged: (text) => bloc.emailSink.add(text),
                              decoration: InputDecoration(
                                  labelText: "Email",
                                  focusedErrorBorder: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(14)),
                                      borderSide: BorderSide(
                                        color: Colors.red,
                                      )),
                                  errorBorder: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(14)),
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
                                      borderSide:
                                          BorderSide(color: Colors.grey))),
                            );
                          }),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      child: StreamBuilder<String>(
                          stream: bloc.passwordStream,
                          builder: (context, snapshot) {
                            return TextField(
                              onChanged: (text) => bloc.passwordSink.add(text),
                              decoration: InputDecoration(
                                  labelText: "Password",
                                  focusedErrorBorder: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(14)),
                                      borderSide: BorderSide(
                                        color: Colors.red,
                                      )),
                                  errorBorder: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(14)),
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
                                      borderSide:
                                          BorderSide(color: Colors.grey))),
                            );
                          }),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      child: StreamBuilder<String>(
                          stream: bloc.confirmStream,
                          builder: (context, snapshot) {
                            return TextField(
                              onChanged: (text) => bloc.confirmdSink.add(text),
                              decoration: InputDecoration(
                                  labelText: "Confirm Password",
                                  focusedErrorBorder: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(14)),
                                      borderSide: BorderSide(
                                        color: Colors.red,
                                      )),
                                  errorBorder: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(14)),
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
                                      borderSide:
                                          BorderSide(color: Colors.grey))),
                            );
                          }),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                      child: ElevatedButton(
                        onPressed: () {
                          bloc.eventSink.add(SignUpEvent.SIGNUP);
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xff275C2E),
                            minimumSize: const Size.fromHeight(50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14))),
                        child: Text(
                          "Signup",
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already Registered,',
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Login here',
                            style: TextStyle(
                                fontSize: 14, color: Color(0xff275C2E)),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
