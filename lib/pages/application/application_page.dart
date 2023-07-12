import 'package:course_application_mobile/pages/application/bloc/app_blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:course_application_mobile/common/values/colors.dart';
import 'package:course_application_mobile/pages/application/bloc/app_states.dart';
import 'package:course_application_mobile/pages/application/widgets/application_widgets.dart';

import 'bloc/app_events.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({Key? key}) : super(key: key);

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBlocs, AppState>(builder: (context, state) {
      return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            body: buildPage(state.index),
            bottomNavigationBar: Container(
              width: 375.w,
              height: 58.h,
              decoration: BoxDecoration(
                  color: AppColors.primaryElement,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.h),
                      topRight: Radius.circular(20.h)
                  ),
                  boxShadow: [
                    BoxShadow(
                      color:Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 1,
                    )
                  ]
              ),
              child: BottomNavigationBar(
                currentIndex: state.index,
                onTap: (value) {
                  context.read<AppBlocs>().add(TriggerAppEvent(value));
                },
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                selectedItemColor: AppColors.primaryElement,
                unselectedItemColor: AppColors.primaryFourElementText,
                items: bottomTabs,
              ),
            ),

            // body: buildPage(0),
            // bottomNavigationBar: BottomNavigationBar(
            //   onTap: (value) {
            //     // print("ok");
            //     context.read<AppBlocs>().add(TriggerAppEvent(value));
            //   },
            //   elevation: 0,
            //   type: BottomNavigationBarType.fixed,
            //   showSelectedLabels: false,
            //   showUnselectedLabels: false,
            //   selectedItemColor: AppColors.primaryElement,
            //   unselectedItemColor: AppColors.primaryFourElementText,
            //   items: [
            //     BottomNavigationBarItem(
            //       label: "home",
            //       icon: SizedBox(
            //         width: 15.w,
            //         height: 15.h,
            //         child: Image.asset(
            //           "assets/icons/home.png",
            //         ),
            //       ),
            //     ),
            //     BottomNavigationBarItem(
            //       label: "search",
            //       icon: SizedBox(
            //         width: 15.w,
            //         height: 15.h,
            //         child: Image.asset(
            //           "assets/icons/home.png",
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ),
        ),
      );
    });
  }
}