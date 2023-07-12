import 'package:course_application_mobile/pages/register/bloc/register_events.dart';
import 'package:course_application_mobile/pages/register/bloc/register_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBlocs extends Bloc<RegisterEvent, RegisterStates>{
   RegisterBlocs():super(const RegisterStates()){
     on<FirstNameEvent>(_firstNameEvent);
     on<LastNameEvent>(_lastNameEvent);
     on<EmailEvent>(_emailEvent);
     on<PasswordEvent>(_passwordEvent);
     on<RePasswordEvent>(_rePasswordEvent);
   }

   void _firstNameEvent(FirstNameEvent event, Emitter<RegisterStates> emit){
     print("${event.firstName}");
      emit(state.copyWith(firstName:event.firstName));
   }
   void _lastNameEvent(LastNameEvent event, Emitter<RegisterStates> emit){
     print("${event.lastName}");
      emit(state.copyWith(lastName:event.lastName));
   }
   void _emailEvent(EmailEvent event, Emitter<RegisterStates> emit){
     print("${event.email}");
      emit(state.copyWith(email:event.email));
   }
   void _passwordEvent(PasswordEvent event, Emitter<RegisterStates> emit){
     print("${event.password}");
      emit(state.copyWith(password:event.password));
   }
   void _rePasswordEvent(RePasswordEvent event, Emitter<RegisterStates> emit){
     print("${event.rePassword}");
      emit(state.copyWith(rePassword:event.rePassword));
   }
}
