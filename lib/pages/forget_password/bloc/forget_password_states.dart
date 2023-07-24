class ForgetPasswordStates {
  final String email;

  //optional named parameter
  const ForgetPasswordStates({
    this.email = "",
  });

  ForgetPasswordStates copyWith({
    String? email,
  }) {
    return ForgetPasswordStates(
      email: email ?? this.email,
    );
  }
}