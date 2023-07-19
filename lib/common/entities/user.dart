// import 'package:cloud_firestore/cloud_firestore.dart';

class LoginRequestEntity {
  String? email;
  String? password;

  LoginRequestEntity({
    this.email,
    this.password,
  });

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}

class RegisterResponseEntity {
  final String? type;
  final String? message;

  RegisterResponseEntity({
    this.type,
    this.message,
  });

  factory RegisterResponseEntity.fromJson(Map<String, dynamic> json) {
    return RegisterResponseEntity(
      type: json['type'],
      message: json['message'],
    );
  }
}

//api post response msg
class UserLoginResponseEntity {
  String? type;
  String? message;
  String? accessToken;
  String? refreshToken;

  UserLoginResponseEntity({
    this.type,
    this.message,
    this.accessToken,
    this.refreshToken,
  });

  Map<String, dynamic> toJson() => {
    "type": type,
    "message": message,
    "access_token": accessToken,
    "refresh_token": refreshToken,
  };

  factory UserLoginResponseEntity.fromJson(Map<String, dynamic> json) =>
      UserLoginResponseEntity(
        type: json['type'],
        message: json['message'],
        accessToken: json['access_token'],
        refreshToken: json['refresh_token'],
      );
}

// login result
class UserProfile {
  String? access_token;
  String? token;
  String? firstName;
  String? lastName;
  String? avatar;
  int? status;
  String? type;

  UserProfile({
    this.access_token,
    this.token,
    this.firstName,
    this.lastName,
    this.avatar,
    this.status,
    this.type,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        access_token: json["access_token"],
        token: json["token"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
        status: json["status"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": access_token,
        "token": token,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
        "status": status,
        "type": type,
      };
}

class UserProfileEntity {
  int? id;
  String? type;
  String? message;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? avatar;
  String? role;
  int? status;
  bool? notify;

  UserProfileEntity({
    this.id,
    this.type,
    this.message,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.avatar,
    this.role,
    this.status,
    this.notify,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'avatar': avatar,
      'role': role,
      'status': status,
      'notify': notify,
    };
  }

  factory UserProfileEntity.fromJson(Map<String, dynamic> json) =>
      UserProfileEntity(
        id: json['id'],
        type: json['type'],
        message: json['message'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        email: json['email'],
        password: json['password'],
        avatar: json['imageUrl'],
        role: json['role'],
        status: json['status'],
        notify: json['notify'],
      );
}

class RefreshTokenResponseEntity {
  String? type;
  String? message;
  String? accessToken;
  String? refreshToken;

  RefreshTokenResponseEntity({
    this.type,
    this.message,
    this.accessToken,
    this.refreshToken,
  });

  Map<String, dynamic> toJson() => {
    "type": type,
    "message": message,
    "access_token": accessToken,
    "refresh_token": refreshToken,
  };

  factory RefreshTokenResponseEntity.fromJson(Map<String, dynamic> json) =>
      RefreshTokenResponseEntity(
        type: json['type'],
        message: json['message'],
        accessToken: json['access_token'],
        refreshToken: json['refresh_token'],
      );
}