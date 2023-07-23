import 'package:course_application_mobile/common/apis/user_api.dart';
import 'package:course_application_mobile/common/entities/entities.dart';
import 'package:course_application_mobile/common/utils/http_util.dart';
import 'package:course_application_mobile/common/values/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../common/widgets/flutter_toast.dart';
import 'bloc/reset_password_blocs.dart';

class ResetPasswordController {
  final BuildContext context;

  const ResetPasswordController({required this.context});

  Future<void> handleResetPassword() async {
    final state = context.read<ResetPasswordBlocs>().state;

    // khi vao page này phải get đc token trên URL, doc tren state ben page reset password
    var queryParams = {
      "token": Uri.encodeComponent(state.token),
      "password": Uri.encodeComponent(state.newPassword),
      "confirmPassword": Uri.encodeComponent(state.confirmPassword),
    };

    var uri = Uri(path: '/auth/reset-password', queryParameters: queryParams);

    try {
      var res = await HttpUtil().post(uri.toString());

      if (res.data.type == "success") {
        toastInfo(msg: res.data.message!);
        Navigator.of(context).pop();
      } else {
        throw Exception(AppMessage.MESSAGE_GENERAL_FAILED);
      }
    } catch (e) {
      toastInfo(msg: AppMessage.MESSAGE_GENERAL_FAILED);
      throw Exception(AppMessage.MESSAGE_GENERAL_FAILED);
    }

    // ForgetPasswordResponseEntity res =
    //     await UserAPI.resetPassword(state.newPassword, state.confirmPassword, state.token);

    // if (res.type == "success") {
    //   toastInfo(msg: res.message!);
    //   Navigator.of(context).pop();
    // }
  }
}
