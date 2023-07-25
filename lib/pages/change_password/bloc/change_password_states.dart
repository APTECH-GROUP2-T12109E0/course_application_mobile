import '../../../common/entities/user.dart';

class ChangePasswordStates {
  final String email;
  final String oldPassword;
  final String password;
  final String confirmPassword;
  final UserProfile? userProfile;

  //optional named parameter
  const ChangePasswordStates(
      {
        this.email = "",
        this.oldPassword = "",
        this.password = "",
        this.confirmPassword = "",
        this.userProfile
      });

  ChangePasswordStates copyWith(
      {String? email, String? oldPassword, String? password, String? confirmPassword, UserProfile? userProfile}) {
    return ChangePasswordStates(
        email: email ?? this.email,
        oldPassword: oldPassword ?? this.oldPassword,
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        userProfile: userProfile??this.userProfile
    );
  }
}