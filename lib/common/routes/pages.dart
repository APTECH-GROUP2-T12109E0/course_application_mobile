import 'package:course_application_mobile/pages/change_password/bloc/change_password_bloc.dart';
import 'package:course_application_mobile/pages/change_password/change_password.dart';
import 'package:course_application_mobile/pages/checkout/bloc/checkout_blocs.dart';
import 'package:course_application_mobile/pages/checkout/checkout.dart';
import 'package:course_application_mobile/pages/course/learning_page/learning_page_detail.dart';
import 'package:course_application_mobile/pages/course/my_courses/bloc/my_courses_blocs.dart';
import 'package:course_application_mobile/pages/course/my_courses/my_courses.dart';
import 'package:course_application_mobile/pages/course/section/section_detail.dart';
import 'package:course_application_mobile/pages/main/bloc/main_blocs.dart';
import 'package:course_application_mobile/pages/main/main_screen.dart';
import 'package:course_application_mobile/pages/profile/bloc/profile_blocs.dart';
import 'package:course_application_mobile/pages/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:course_application_mobile/common/routes/route_name.dart';
import '../../global.dart';
import '../../pages/application/application_page.dart';
import '../../pages/application/bloc/app_blocs.dart';
import '../../pages/course/course_detail/bloc/course_detail_blocs.dart';
import '../../pages/course/course_detail/course_detail.dart';
import '../../pages/course/learning_page/bloc/learning_page_blocs.dart';
import '../../pages/course/learning_page/learning_page_detail.dart';
import '../../pages/course/my_course_detail/bloc/my_course_detail_blocs.dart';
import '../../pages/course/my_course_detail/my_course_detail.dart';
import '../../pages/course/my_sections/bloc/my_section_blocs.dart';
import '../../pages/course/my_sections/my_section_detail.dart';
import '../../pages/course/paywebview/bloc/payview_blocs.dart';
import '../../pages/course/paywebview/payment.dart';
import '../../pages/course/paywebview/paywebview.dart';
import '../../pages/course/section/bloc/section_blocs.dart';
import '../../pages/forget_password/bloc/forget_password_blocs.dart';
import '../../pages/forget_password/forget_password.dart';
import '../../pages/home/bloc/home_page_blocs.dart';
import '../../pages/home/home_page.dart';
import '../../pages/profile/settings/bloc/settings_blocs.dart';
import '../../pages/profile/settings/settings_page.dart';
import '../../pages/register/bloc/register_blocs.dart';
import '../../pages/register/register.dart';
import '../../pages/sign_in/bloc/sign_in_bloc.dart';
import '../../pages/sign_in/sign_in.dart';
import '../../pages/welcome/welcome.dart';
import '../../pages/welcome/bloc/welcome_blocs.dart';

//blocprovider routes, pages
class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page, this.bloc});
}

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
          route: AppRoutes.INITIAL,
          page: const Welcome(),
          bloc: BlocProvider(
            create: (_) => WelcomeBloc(),
          )),
      PageEntity(
          route: AppRoutes.SING_IN,
          page: const SignIn(),
          bloc: BlocProvider(
            create: (_) => SignInBloc(),
          )),
      PageEntity(
          route: AppRoutes.REGISTER,
          page: const Register(),
          bloc: BlocProvider(
            create: (_) => RegisterBlocs(),
          )),
      PageEntity(
          route: AppRoutes.APPLICATION,
          page: const ApplicationPage(),
          bloc: BlocProvider(
            create: (_) => AppBlocs(),
          )),
      PageEntity(
          route: AppRoutes.HOME_PAGE,
          page: const HomePage(),
          bloc: BlocProvider(
            create: (_) => HomePageBlocs(),
          )),
      PageEntity(
          route: AppRoutes.SETTINGS,
          page: const SettingsPage(),
          bloc: BlocProvider(
            create: (_) => SettingsBlocs(),
          )),
      PageEntity(
          route: AppRoutes.MAIN_SCREEN,
          page: MainScreenPage(),
          bloc: BlocProvider(
            create: (_) => MainScreenBloc(),
          )),
      PageEntity(
          route: AppRoutes.COURSE_DETAIL,
          page: const CourseDetail(),
          bloc: BlocProvider(create: (_)=>CourseDetailBloc(),)
      ),
      PageEntity(
          route: AppRoutes.SECTION_DETAIL,
          page: const SectionDetail(),
          bloc: BlocProvider(create: (_)=>SectionDetailBloc(),)
      ),
      PageEntity(
          route: AppRoutes.LEARNING_DETAIL,
          page: const LearningPage(),
          bloc: BlocProvider(create: (_)=>LearningBlocs(),)
      ),

      PageEntity(
          route: AppRoutes.PAY_WEB_VIEW,
          page: const PayWebView(),
          bloc: BlocProvider(create: (_)=>PayWebViewBlocs(),)
      ),
      PageEntity(
          route: AppRoutes.PROFILE,
          page: const ProfilePage(),
          bloc: BlocProvider(create: (_)=>ProfileBlocs(),)
      ),
      PageEntity(
          route: AppRoutes.MY_COURSES,
          page: const MyCourses(),
          bloc: BlocProvider(create: (_)=>MyCourseBlocs(),)
      ),
      PageEntity(
          route: AppRoutes.MY_COURSE_DETAIL,
          page: const MyCourseDetail(),
          bloc: BlocProvider(create: (_)=>MyCourseDetailBlocs(),)
      ),
      PageEntity(
          route: AppRoutes.MY_SECTION_DETAIL,
          page: const MySectionDetail(),
          bloc: BlocProvider(create: (_)=>MySectionDetailBloc(),)
      ),
      PageEntity(
          route: AppRoutes.FORGET_PASSWORD,
          page: const ForgetPassword(),
          bloc: BlocProvider(create: (_)=>ForgetPasswordBlocs(),)
      ),
      PageEntity(
          route: AppRoutes.CHECKOUT,
          page: const Checkout(),
          bloc: BlocProvider(create: (_)=>CheckoutDetailBloc(),)
      ),
      PageEntity(
          route: AppRoutes.CHANGE_PASSWORD,
          page: const ChangePassword(),
          bloc: BlocProvider(create: (_)=>ChangePassWordBlocs(),)
      ),
    ];
  }

//all bloc providers
  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  // a modal that covers entire screen as we click on navigator object
  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      //check for route name matching when navigator gets triggered.
      var result = routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        if (result.first.route == AppRoutes.INITIAL && deviceFirstOpen) {
          bool isLoggedin = Global.storageService.getIsLoggedIn();
          if (isLoggedin) {
            return MaterialPageRoute(
                builder: (_) => const ApplicationPage(), settings: settings);
          }
          return MaterialPageRoute(
              builder: (_) => const SignIn(), settings: settings);
        }
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }
    return MaterialPageRoute(
        builder: (_) => const SignIn(), settings: settings);
  }
}
