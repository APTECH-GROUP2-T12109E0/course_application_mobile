import 'dart:convert';

import 'package:course_application_mobile/common/values/colors.dart';
import 'package:course_application_mobile/common/widgets/base_text_widgets.dart';

import 'package:course_application_mobile/pages/profile/bloc/profile_blocs.dart';
import 'package:course_application_mobile/pages/profile/bloc/profile_events.dart';
import 'package:course_application_mobile/pages/profile/bloc/profile_states.dart';
import 'package:course_application_mobile/pages/profile/widgets/profile_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/entities/user.dart';
import '../../global.dart';
import '../home/home_controller.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);


  @override
  State<ProfilePage> createState() => _ProfilePageState();
}


class _ProfilePageState extends State<ProfilePage> {

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    var userProfile = Global.storageService.getUserProfile();
    print("userProfile is ${jsonEncode(userProfile)}");
    context.read<ProfileBlocs>().add(TriggerProfileName(userProfile));
  }
  UserProfile get userProfile => Global.storageService.getUserProfile();
  // UserProfile userProfile = UserProfile();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBlocs, ProfileStates>(builder: (context, state) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppbar(),
        body: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                profileIconAndEditButton(userProfile.avatar.toString()),
                profilePageText(userProfile.firstName.toString()),
                buildRowView(context),
                Padding(
                  padding: EdgeInsets.only(left:25.w ),
                  child: buildListView(context),
                ),
              ],
            ),
          ),
        ),
      );
    },);
  }
}