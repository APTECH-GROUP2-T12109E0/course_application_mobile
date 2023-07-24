import 'dart:ffi';

import 'package:course_application_mobile/common/values/colors.dart';
import 'package:course_application_mobile/global.dart';
import 'package:course_application_mobile/pages/checkout/bloc/checkout_blocs.dart';
import 'package:course_application_mobile/pages/checkout/bloc/checkout_events.dart';
import 'package:course_application_mobile/pages/checkout/bloc/checkout_states.dart';
import 'package:course_application_mobile/pages/checkout/checkout_controller.dart';
import 'package:course_application_mobile/pages/checkout/widget/checkout_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/entities/user.dart';
import '../common_widgets.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  late CheckoutDetailController _checkoutDetailController;
  UserProfile userProfile = Global.storageService.getUserProfile();
  @override
  void initState(){
    super.initState();

  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    Future.delayed(Duration(seconds: 0), () {
      _checkoutDetailController = CheckoutDetailController(context: context);
      _checkoutDetailController.init();
      context.read<CheckoutDetailBloc>().add(TriggerCheckoutDetail(args["course"]));
      print("call courseitem in checkout ok");
    });
  }

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<CheckoutDetailBloc, CheckoutDetailStates>(
        builder: (context, state) {
          print("ok vo check out");
      return state.courseItem==null?const Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.blue,
        ),
      ):

        Scaffold(
        appBar: buildAppBar("Checkout"),
        body: Center(
            child: Stack(
          children: [
            Container(
              child: Center(
                child: Opacity(
                    opacity: 0.5,
                    child: Image.asset(
                      "assets/logo/logo_click_thumb_light.png",
                      fit: BoxFit.cover,
                      width: 300.w,
                      height: 300.h,
                    )),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 300.w,
                    height: 80.h,
                    child:
                        Image.asset("assets/logo/logo_click_light_short.png"),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 70.w),
                  width: 300.w,
                  height: 200.h,
                  color: Colors.white.withOpacity(0.1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      itemInfo("First name", userProfile.firstName.toString()),
                      itemInfo("Last name", userProfile.lastName.toString()),
                      itemInfo("Course name", state.courseItem!.name.toString()),
                      itemInfo("Price", state.courseItem!.price.toString()),
                      itemInfo("Payment method", "PAYPAL"),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed("/paypal");
                  },
                  child: Center(
                    child: Container(
                      width: 100.w,
                      height: 50.h,
                      color: AppColors.primaryColor,
                      child: Text("Checkout"),
                    ),
                  ),
                ),


              ],
            ),
          ],
        )),
      );
    });
  }
}
