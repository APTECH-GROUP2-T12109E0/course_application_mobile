// import 'package:cloud_firestore/cloud_firestore.dart';

class LoginRequestEntity {
  int? type;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? phone;
  String? avatar;
  String? role;
  int? status;

  LoginRequestEntity({
    this.type,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.phone,
    this.avatar,
    this.role,
    this.status,
  });

  Map<String, dynamic> toJson() => {
        "type": type,
        "first_Name": firstName,
        "last_Name": lastName,
        "email": email,
        "password": password,
        "phone": phone,
        "avatar": avatar,
        "role": role,
        "status": status,
      };
}

//api post response msg
class UserLoginResponseEntity {
  int? code;
  String? msg;
  UserItem? data;

  UserLoginResponseEntity({
    this.code,
    this.msg,
    this.data,
  });

  factory UserLoginResponseEntity.fromJson(Map<String, dynamic> json) =>
      UserLoginResponseEntity(
        code: json["code"],
        msg: json["msg"],
        data: UserItem.fromJson(json["data"]),
      );
}

// login result
class UserItem {
  String? access_token;
  String? token;
  String? firstName;
  String? lastName;
  String? avatar;
  int? status;
  int? type;

  UserItem({
    this.access_token,
    this.token,
    this.firstName,
    this.lastName,
    this.avatar,
    this.status,
    this.type,
  });

  factory UserItem.fromJson(Map<String, dynamic> json) => UserItem(
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
//firestore
// class UserData {
//   final String? token;
//   final String? name;
//   final String? avatar;
//   final String? description;
//   final int? online;

//   UserData({
//     this.token,
//     this.name,
//     this.avatar,
//     this.description,
//     this.online,
//   });

  // factory UserData.fromFirestore(
  //     DocumentSnapshot<Map<String, dynamic>> snapshot,
  //     SnapshotOptions? options,
  //     ) {
  //   final data = snapshot.data();
  //   return UserData(
  //     token: data?['token'],
  //     name: data?['first_name'],
  //     avatar: data?['avatar'],
  //     description: data?['description'],
  //     online: data?['online'],
  //   );
  // }

  // Map<String, dynamic> toFirestore() {
  //   return {
  //     if (token != null) "token": token,
  //     if (name != null) "name": name,
  //     if (avatar != null) "avatar": avatar,
  //     if (description != null) "description": description,
  //     if (online != null) "online": online,
  //   };
  // }
// }


