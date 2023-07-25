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

class ForgetPasswordResponseEntity {
  final String? type;
  final String? message;

  ForgetPasswordResponseEntity({
    this.type,
    this.message,
  });

  factory ForgetPasswordResponseEntity.fromJson(Map<String, dynamic> json) {
    return ForgetPasswordResponseEntity(
      type: json['type'],
      message: json['message'],
    );
  }
}

class ChangePasswordResponseEntity {
  final String? type;
  final String? message;
  final String? statusCode;
  final String? statusMessage;

  ChangePasswordResponseEntity({
    this.type,
    this.message,
    this.statusCode,
    this.statusMessage,
  });

  factory ChangePasswordResponseEntity.fromJson(Map<String, dynamic> json) {
    return ChangePasswordResponseEntity(
      type: json['type'],
      message: json['message'],
      statusCode: json['statusCode'],
      statusMessage: json['statusMessage'],
    );
  }
}

class ChangePasswordRequestEntity {
  String? oldPassword;
  String? password;
  String? confirmPassword;

  ChangePasswordRequestEntity({
    this.oldPassword,
    this.password,
    this.confirmPassword,
  });

  Map<String, dynamic> toJson() => {
    "oldPassword": oldPassword,
    "password": password,
    "access_token": confirmPassword,
  };

  factory ChangePasswordRequestEntity.fromJson(Map<String, dynamic> json) =>
      ChangePasswordRequestEntity(
        oldPassword: json['oldPassword'],
        password: json['password'],
        confirmPassword: json['confirmPassword'],
      );
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
  String? refresh_token;
  String? token;
  String? firstName;
  String? lastName;
  String? avatar;
  int? status;
  String? type;
  int? id;

  UserProfile({
    this.access_token,
    this.refresh_token,
    this.token,
    this.firstName,
    this.lastName,
    this.avatar,
    this.status,
    this.type,
    this.id,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        access_token: json["access_token"],
        refresh_token: json["refresh_token"],
        token: json["token"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
        status: json["status"],
        type: json["type"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": access_token,
        "refresh_token": refresh_token,
        "token": token,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
        "status": status,
        "type": type,
        "id": id,
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

class UserIdRequestEntity {
  int? userId;

  // String? name;

  UserIdRequestEntity({
    this.userId,
    // this.name
  });

  Map<String, dynamic> toJson() =>
      {
        "user_id": userId,
        // "name": name,
      };
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