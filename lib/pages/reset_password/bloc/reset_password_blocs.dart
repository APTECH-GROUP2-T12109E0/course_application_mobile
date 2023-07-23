import 'package:course_application_mobile/pages/forget_password/bloc/forget_password_events.dart';
import 'package:course_application_mobile/pages/forget_password/bloc/forget_password_states.dart';
import 'package:course_application_mobile/pages/reset_password/bloc/reset_password_events.dart';
import 'package:course_application_mobile/pages/reset_password/bloc/reset_password_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordBlocs extends Bloc<ResetPasswordEvent, ResetPasswordStates> {
  ResetPasswordBlocs() : super(const ResetPasswordStates()) {
    on<NewPasswordEvent>(_newPasswordEvent);
    on<ConfirmPasswordEvent>(_confirmPasswordEvent);
    on<TokenEvent>(_tokenEvent);
  }

  void _newPasswordEvent(NewPasswordEvent event, Emitter<ResetPasswordStates> emit) {
    emit(state.copyWith(newPassword: event.newPassword));
  }

  void _confirmPasswordEvent(ConfirmPasswordEvent event, Emitter<ResetPasswordStates> emit) {
    emit(state.copyWith(confirmPassword: event.confirmPassword));
  }

  void _tokenEvent(TokenEvent event, Emitter<ResetPasswordStates> emit) {
    emit(state.copyWith(token: event.token));
  }
}
