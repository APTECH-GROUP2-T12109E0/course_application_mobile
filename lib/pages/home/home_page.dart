import 'package:course_application_mobile/common/widgets/linear_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:course_application_mobile/pages/home/widgets/home_page_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/entities/user.dart';
import '../../common/routes/route_name.dart';
import '../../common/values/colors.dart';
import 'bloc/home_page_blocs.dart';
import 'bloc/home_page_states.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late UserProfile userProfile;

  @override
  void initState() {
    super.initState();
    //_homeController = HomeController(context: context);
    //_homeController.init();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    userProfile = HomeController(context: context).userProfile;
    print("user prfile");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.5),
      appBar: buildAppBar(userProfile.avatar.toString()),
      body: Stack(
        children: [
          const LinearBackground(),
          RefreshIndicator(
            onRefresh: () {
              return HomeController(context: context).init();
            },
            child: BlocBuilder<HomePageBlocs, HomePageStates>(
              builder: (context, state) {
                if (state.courseItem.isEmpty) {
                  HomeController(context: context).init();
                }
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25.w),
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: homePageText(
                          "Hello!",
                          color: AppColors.lightColor,
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: homePageText(userProfile.firstName.toString(), top: 5),
                      ),
                      SliverPadding(
                        padding: EdgeInsets.only(top: 20.h),
                      ),
                      SliverToBoxAdapter(
                        child: searchView(),
                      ),
                      SliverToBoxAdapter(
                        child: slidersView(context, state),
                      ),
                      SliverToBoxAdapter(
                        child: menuView(),
                      ),
                      SliverPadding(
                        padding: EdgeInsets.symmetric(
                            vertical: 18.h, horizontal: 0.w),
                        sliver: SliverGrid(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 15,
                                  crossAxisSpacing: 15,
                                  childAspectRatio: 0.8),
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                      AppRoutes.COURSE_DETAIL,
                                      arguments: {
                                        "id":
                                            state.courseItem.elementAt(index).id
                                      });
                                },
                                child: courseGrid(state.courseItem[index]),
                                // child: courseGrid(),
                              );
                            },
                            childCount: state.courseItem.length,
                            // childCount: 8,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
