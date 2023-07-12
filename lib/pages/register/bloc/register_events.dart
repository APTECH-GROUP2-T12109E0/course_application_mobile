abstract class RegisterEvent {
  const RegisterEvent();
}

class FirstNameEvent extends RegisterEvent{
  final String firstName;
  const FirstNameEvent(this.firstName);
}
class LastNameEvent extends RegisterEvent{
  final String lastName;
  const LastNameEvent(this.lastName);
}
class EmailEvent extends RegisterEvent{
  final String email;
  const EmailEvent(this.email);

}
class PasswordEvent extends RegisterEvent{
  final String password;
  const PasswordEvent(this.password);

}

class RePasswordEvent extends RegisterEvent{
  final String rePassword;
  const RePasswordEvent(this.rePassword);

}