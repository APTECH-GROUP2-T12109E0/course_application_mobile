import 'package:equatable/equatable.dart';

class AuthStates extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginInitState extends AuthStates {}

class LoginLoadingState extends AuthStates {}

class UserLoginSuccessState extends AuthStates {}

class LoginErrorState extends AuthStates {
  final String? message;
  LoginErrorState({this.message});
}
