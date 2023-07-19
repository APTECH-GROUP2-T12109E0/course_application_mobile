import 'package:course_application_mobile/common/values/colors.dart';
import 'package:course_application_mobile/common/values/constants.dart';
import 'package:course_application_mobile/common/widgets/linear_background.dart';
import 'package:course_application_mobile/global.dart';
import 'package:course_application_mobile/main.dart';
import 'package:course_application_mobile/pages/welcome/bloc/welcome_blocs.dart';
import 'package:course_application_mobile/pages/welcome/bloc/welcome_events.dart';
import 'package:course_application_mobile/pages/welcome/bloc/welcome_states.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: BlocBuilder<WelcomeBloc, WelcomeState>(
          builder: (context, state) {
            return Container(
              margin: EdgeInsets.only(top: 20.h),
              width: 375.w,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  const LinearBackground(),
                  PageView(
                    controller: pageController,
                    onPageChanged: (index) {
                      // print("index value is ${index}");
                      state.page = index;
                      BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                    },
                    children: [
                      _page(
                        1,
                        context,
                        "Next",
                        "Welcome to Learning Online Course Application \n",
                        "A project of team: \n\n PHAM QUANG NGOC THACH \n TRUONG DUONG TRUC DUY \n NGUYEN NGOC NGUYEN \n TAT HONG DUC \n DO THANH AN   ",
                        "assets/logo/logo_click_light_split.png",
                      ),
                      _page(
                        2,
                        context,
                        "Next",
                        "All knowledge is yours. \n",
                        "Online learning with all people and tutors in the World.",
                        "assets/images/man.png",
                      ),
                      _page(
                        3,
                        context,
                        "Get Started",
                        "Always Fascinated Learning \n",
                        "Anywhere, Anytime, for Anyone. \n Never stop learning.",
                        "assets/images/boy.png",
                      ),
                    ],
                  ),
                  Positioned(
                      bottom: 20.h,
                      child: DotsIndicator(
                        position: state.page.toInt(),
                        dotsCount: 3,
                        mainAxisAlignment: MainAxisAlignment.center,
                        decorator: DotsDecorator(
                            color: Colors.grey,
                            activeColor: AppColors.primaryColor,
                            size: const Size.square(8.0),
                            activeSize: const Size(15.0, 8.0),
                            activeShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      ))
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _page(int index, BuildContext context, String buttonName, String title,
      String subTitle, String imagePath) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 300.w,
          height: 300.h,
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 25.w, right: 25.w),
          child: Text(
            title,
            style: TextStyle(
              color: AppColors.primaryElementText,
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Center(
          child: Container(
            padding: EdgeInsets.only(left: 30.w, right: 30.w),
            child: Text(
              subTitle,
              style: TextStyle(
                color: AppColors.darkColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (index < 3) {
              //animation
              pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.decelerate,
              );
            } else {
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) => MyHomePage(),
              //   ),
              Global.storageService
                  .setBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME, true);
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("/sign_in", (route) => false);
            }
          },
          child: Container(
            margin: EdgeInsets.only(
              top: 30.h,
              left: 25.w,
              right: 25.w,
            ),
            width: 325.w,
            height: 50.h,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(15.w)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Center(
              child: Text(
                buttonName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
