
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/apis/course_api.dart';
import '../../common/entities/course.dart';
import '../../common/widgets/flutter_toast.dart';
import '../../global.dart';
import 'bloc/checkout_blocs.dart';
import 'bloc/checkout_events.dart';

class CheckoutDetailController {
  final BuildContext context;

  CheckoutDetailController({required this.context});

  void init() async {
    print("before argument checkout");
    final args = ModalRoute
        .of(context)!
        .settings
        .arguments as Map;
    print("init Checkout detail ");
    print("id in course detail controller: ${args["course"]}");
    // asyncLoadCheckoutData(args["course"]);
    // asyncLoadLessonData(args["id"]);
  }

  // asyncLoadCheckoutData(int? id) async {
  //   var userProfile = Global.storageService.getUserProfile();
  //
  //   CheckoutRequestEntity checkoutRequestEntity = CheckoutRequestEntity();
  //   checkoutRequestEntity.courseId = id;
  //   checkoutRequestEntity.userId = userProfile.id;
  //   print("checkout");
  //   try {
  //     print("before call checkout");
  //     var result = await CourseAPI.requestCheckout(params: checkoutRequestEntity);
  //     print("after call checkout");
  //     if (result != null) {
  //       if (context.mounted) {
  //         print('---------context is ready------');
  //         context.read<CheckoutDetailBloc>().add(TriggerCheckoutDetail(result!.courseId as CourseItem));
  //       } else {
  //         print('-------context is not available-------');
  //       }
  //     } else {
  //       toastInfo(msg: "Something went wrong");
  //     }
  //   } catch (e) {
  //     print(e);
  //     print("catch Checkout");
  //   }
  // }


}