abstract class SignInEvent {
  const SignInEvent();
}

class EmailEvent extends SignInEvent {
  final String email;
  const EmailEvent(this.email);
}

class PasswordEvent extends SignInEvent {
  final String password;
  const PasswordEvent(this.password);
}

// class LoginButtonPressed extends SignInEvent {
//   var email = EmailEvent;
//   var password = PasswordEvent;
//   LoginButtonPressed({required this.email, required this.password});
// }
