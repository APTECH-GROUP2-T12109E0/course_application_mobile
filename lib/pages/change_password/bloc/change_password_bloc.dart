import 'package:flutter_bloc/flutter_bloc.dart';

import 'change_password_events.dart';
import 'change_password_states.dart';

class ChangePassWordBlocs extends Bloc<ChangePasswordEvent, ChangePasswordStates>{
  ChangePassWordBlocs():super(const ChangePasswordStates()){
    on<TriggerProfileName>(_triggerProfileName);
    on<EmailEvent>(_emailEvent);
    on<OldPasswordEvent>(_oldPasswordEvent);
    on<PasswordEvent>(_passwordEvent);
    on<ConfirmPasswordEvent>(_confirmPasswordEvent);
  }

    void _emailEvent(EmailEvent event, Emitter<ChangePasswordStates> emit){
    print("${event.email}");
    emit(state.copyWith(email:event.email));
  }

  void _oldPasswordEvent(OldPasswordEvent event, Emitter<ChangePasswordStates> emit){
    print("${event.oldPassword}");
    emit(state.copyWith(oldPassword:event.oldPassword));
  }

  void _passwordEvent(PasswordEvent event, Emitter<ChangePasswordStates> emit){
    print("${event.password}");
    emit(state.copyWith(password:event.password));
  }
  void _confirmPasswordEvent(ConfirmPasswordEvent event, Emitter<ChangePasswordStates> emit){
    print("${event.confirmPassword}");
    emit(state.copyWith(confirmPassword:event.confirmPassword));
  }

  void _triggerProfileName(TriggerProfileName event, Emitter<ChangePasswordStates> emit){
    emit(state.copyWith(userProfile: event.userProfile));
  }
}