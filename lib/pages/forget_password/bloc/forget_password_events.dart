abstract class ForgetPasswordEvent {
  const ForgetPasswordEvent();
}

class EmailEvent extends ForgetPasswordEvent{
  final String email;
  const EmailEvent(this.email);
}