/// data : null
/// status : true
/// code : 201
/// message : "success"

class SignupResponseModel {
  SignupResponseModel({
      dynamic data, 
      bool? status, 
      int? code, 
      String? message,}){
    _data = data;
    _status = status;
    _code = code;
    _message = message;
}

  SignupResponseModel.fromJson(dynamic json) {
    _data = json['data'];
    _status = json['status'];
    _code = json['code'];
    _message = json['message'];
  }
  dynamic _data;
  bool? _status;
  int? _code;
  String? _message;

  dynamic get data => _data;
  bool? get status => _status;
  int? get code => _code;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['data'] = _data;
    map['status'] = _status;
    map['code'] = _code;
    map['message'] = _message;
    return map;
  }

}