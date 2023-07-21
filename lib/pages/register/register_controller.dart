import 'package:course_application_mobile/common/apis/user_api.dart';
import 'package:course_application_mobile/common/entities/entities.dart';
import 'package:course_application_mobile/common/values/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../common/widgets/flutter_toast.dart';
import 'bloc/register_blocs.dart';

class RegisterController {
  final BuildContext context;

  const RegisterController({required this.context});

  Future<void> handleRegister() async {
    final state = context.read<RegisterBlocs>().state;

    try {
      RegisterResponseEntity registerRes =
          await UserAPI.register(state.firstName, state.lastName, state.email, state.password);

      if (registerRes.type == "success") {
        toastInfo(msg: registerRes.message!);
        Navigator.of(context).pop();
      }
    } catch (e) {
      print(e);
      toastInfo(msg: AppMessage.MESSAGE_GENERAL_FAILED);
    }
  }
}
