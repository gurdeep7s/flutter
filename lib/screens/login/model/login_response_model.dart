import 'package:flutter/cupertino.dart';

/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOjI1LCJpYXQiOjE2Mzg0NDcwNzl9.yACBmt9EqvobTG2DnbkejjGA-3RN5RB56HUMzIDeUIM"
/// data : {"id":25,"name":"test303","email":"test307@gmail.com","password":"123456","isVerified":0,"updated_at":"1899-11-29T18:38:50.000Z","created_at":"1899-11-29T18:38:50.000Z"}
/// status : true
/// message : "success"
/// code : 201

class LoginResponseModel {
  LoginResponseModel({
    String? token,
    Data? data,
    required bool status,
    required String message,
    required int code,
  }) {
    _token = token!;
    _data = data!;
    _status = status;
    _message = message;
    _code = code;
  }

  LoginResponseModel.fromJson(dynamic json) {
   // debugPrint("Ressss " +json);
    _token = json['token'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _status = json['status'];
    _message = json['message'];
    _code = json['code'];
  }

  String? _token;
  Data? _data;
 late bool _status;
  late String _message;
  late int _code;

  String get token => _token!;

  Data get data => _data!;

  bool get status => _status;

  String get message => _message;

  int get code => _code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['status'] = _status;
    map['message'] = _message;
    map['code'] = _code;
    return map;
  }
}

/// id : 25
/// name : "test303"
/// email : "test307@gmail.com"
/// password : "123456"
/// isVerified : 0
/// updated_at : "1899-11-29T18:38:50.000Z"
/// created_at : "1899-11-29T18:38:50.000Z"

class Data {
  Data({
    required int id,
    required String name,
    required String email,
    required String password,
    required int isVerified,
    required String updatedAt,
    required String createdAt,
  }) {
    _id = id;
    _name = name;
    _email = email;
    _password = password;
    _isVerified = isVerified;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _password = json['password'];
    _isVerified = json['isVerified'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
  }

  late int _id;
  late String _name;
  late  String _email;
  late String _password;
  late int _isVerified;
  late String _updatedAt;
  late String _createdAt;

  int get id => _id;

  String get name => _name;

  String get email => _email;

  String get password => _password;

  int get isVerified => _isVerified;

  String get updatedAt => _updatedAt;

  String get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['password'] = _password;
    map['isVerified'] = _isVerified;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    return map;
  }
}
