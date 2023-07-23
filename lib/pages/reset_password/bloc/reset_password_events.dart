abstract class ResetPasswordEvent {
  const ResetPasswordEvent();
}

class NewPasswordEvent extends ResetPasswordEvent{
  final String newPassword;
  const NewPasswordEvent(this.newPassword);
}

class ConfirmPasswordEvent extends ResetPasswordEvent{
  final String confirmPassword;
  const ConfirmPasswordEvent(this.confirmPassword);
}

class TokenEvent extends ResetPasswordEvent{
  final String token;
  const TokenEvent(this.token);
}
