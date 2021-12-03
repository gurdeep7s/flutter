import 'dart:async';

mixin ValidatorClass {
  var emailValidator =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.isEmpty) {
      return sink.addError("Please enter  Email address");
    } else if (!email.contains("@") && !email.contains(".")) {
      return sink.addError("Please enter valid Email address");
    } else {
      sink.add(email);
    }
  });

  var passValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length < 5) {
      return sink.addError("Password should be greater than 5 digits");
    } else {
      sink.add(password);
    }
  });

  var confirmpassValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
        if (password.length < 5) {
          return sink.addError("Password should be greater than 5 digits");
        } else {
          sink.add(password);
        }
      });

  var nameValidation =
      StreamTransformer<String, String>.fromHandlers(handleData: (name, sink) {
    if (name.length == 0) {
      return sink.addError("Please enter full name");
    } else {
      sink.add(name);
    }
  });
}
