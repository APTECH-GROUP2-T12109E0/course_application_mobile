class ResetPasswordStates {
  final String newPassword;
  final String confirmPassword;
  final String token;

  const ResetPasswordStates({
    this.newPassword = "",
    this.confirmPassword = "",
    this.token = "",
  });

  ResetPasswordStates copyWith({
    String? newPassword,
    String? confirmPassword,
    String? token,
  }) {
    return ResetPasswordStates(
      newPassword: newPassword ?? this.newPassword,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      token: token ?? this.token,
    );
  }
}
