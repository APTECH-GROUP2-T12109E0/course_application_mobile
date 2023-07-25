import '../../../common/entities/user.dart';

abstract class ChangePasswordEvent {
  const ChangePasswordEvent();
}

class EmailEvent extends ChangePasswordEvent{
  final String email;
  const EmailEvent(this.email);

}

class OldPasswordEvent extends ChangePasswordEvent{
  final String oldPassword;
  const OldPasswordEvent(this.oldPassword);

}

class PasswordEvent extends ChangePasswordEvent{
  final String password;
  const PasswordEvent(this.password);

}

class ConfirmPasswordEvent extends ChangePasswordEvent{
  final String confirmPassword;
  const ConfirmPasswordEvent(this.confirmPassword);
}

class TriggerProfileName extends ChangePasswordEvent{
  final UserProfile userProfile;
  const TriggerProfileName(this.userProfile);
}