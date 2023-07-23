import 'package:course_application_mobile/pages/forget_password/bloc/forget_password_events.dart';
import 'package:course_application_mobile/pages/forget_password/bloc/forget_password_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordBlocs extends Bloc<ForgetPasswordEvent, ForgetPasswordStates> {
  ForgetPasswordBlocs() : super(const ForgetPasswordStates()) {
    on<EmailEvent>(_emailEvent);
  }

  void _emailEvent(EmailEvent event, Emitter<ForgetPasswordStates> emit) {
    print(event.email);
    emit(state.copyWith(email: event.email));
  }
}
