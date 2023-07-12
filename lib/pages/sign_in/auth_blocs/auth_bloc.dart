// import 'package:course_application_mobile/common/apis/user_api.dart';
// import 'package:course_application_mobile/pages/sign_in/auth_blocs/auth_events.dart';
// import 'package:course_application_mobile/pages/sign_in/auth_blocs/auth_states.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// // class AuthBloc extends Bloc<AuthEvents, AuthStates> {
// //   AuthBloc(super.initialState);
// //   // AuthBloc(AuthStates initialState):super(initialState);

// //   Stream<AuthStates> mapEventToState(AuthEvents event) async* {
// //     var pref = await SharedPreferences.getInstance();
// //     if (event is StartEvent) {
// //       yield LoginInitState();
// //     } else if (event is LoginButtonPressed) {
// //       yield LoginLoadingState();
// //       var data = await UserAPI.login(event.email, event.password);
// //       if (data["role"] == "USER") {
// //         pref.setString("access_token", data["access_token"]);
// //         pref.setString("role", data["role"]);
// //         pref.setString("email", data["email"]);
// //         yield UserLoginSuccessState();
// //       } else if (data['role'] != "USER") {
// //         LoginErrorState();
// //       }
// //     }
// //     throw UnimplementedError();
// //   }
// // }
// class AuthBloc extends Bloc<AuthEvents, AuthStates> {
//   AuthBloc() : super(AuthStates()) {
//     print("sign in bloc");
//     on<EmailEvent>(_emailEvent);
//     on<PasswordEvent>(_passwordEvent);
//   }

//   void _emailEvent(EmailEvent event, Emitter<SignInState> emit) {
//     print("my email is ${event.email}");
//     emit(state.copyWith(email: event.email));
//   }

//   void _passwordEvent(PasswordEvent event, Emitter<SignInState> emit) {
//     print("my password is ${event.password}");
//     emit(state.copyWith(password: event.password));
//   }
// }
