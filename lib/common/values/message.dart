import 'package:flutter/cupertino.dart';

class AppMessage{
  static const String MESSAGE_GENERAL_FAILED = "Something was wrong !";
  static const String MESSAGE_ALL_FIELD_REQUIRED = "Please fill all fields";
  static const String MESSAGE_FIELD_REQUIRED = "This field is required";
  static const String MESSAGE_EMAIL_INVALID = "Invalid email! Correct: example@domain.com";
  static const String MESSAGE_TOKEN_INVALID = "Your session maybe expired! Please login again";
  static const String MESSAGE_SEND_EMAIL_FORGET_PASSWORD = "We has successfully sent an email to reset your password. Please check your inbox or trash and follow the instructions provided.";
  Widget messText(){
    return Container();
  }

}