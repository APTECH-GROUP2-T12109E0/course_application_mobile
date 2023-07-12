class RegisterStates {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String rePassword;

  //optional named parameter
  const RegisterStates(
      {this.firstName = "",
      this.lastName = "",
      this.email = "",
      this.password = "",
      this.rePassword = ""});

  RegisterStates copyWith(
      {String? firstName, String? lastName, String? email, String? password, String? rePassword}) {
    return RegisterStates(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        password: password ?? this.password,
        rePassword: rePassword ?? this.password);
  }
}