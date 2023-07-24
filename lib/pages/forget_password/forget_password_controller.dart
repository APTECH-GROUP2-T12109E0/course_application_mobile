import 'package:course_application_mobile/common/apis/user_api.dart';
import 'package:course_application_mobile/common/entities/entities.dart';
import 'package:course_application_mobile/common/values/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../common/widgets/flutter_toast.dart';
import 'bloc/forget_password_blocs.dart';

class ForgetPasswordController {
  final BuildContext context;

  const ForgetPasswordController({required this.context});

  Future<void> handleForgotPassword() async {
    final state = context.read<ForgetPasswordBlocs>().state;

    try {
      ForgetPasswordResponseEntity res =
      await UserAPI.forgetPassword(state.email);

      if (res.type == "success") {
        toastInfo(msg: AppMessage.MESSAGE_SEND_EMAIL_FORGET_PASSWORD);
        Navigator.of(context).pop();
      }
    } catch (e) {
      print(e);
      toastInfo(msg: AppMessage.MESSAGE_GENERAL_FAILED);
    }
  }
}