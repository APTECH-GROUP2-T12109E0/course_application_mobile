import 'package:course_application_mobile/pages/profile/widgets/profile_widgets.dart';
import 'package:flutter/material.dart';
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
  UserProfile get userProfile => Global.storageService.getUserProfile();
  // UserProfile userProfile = UserProfile();

  @override
  Widget build(BuildContext context) {
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
              SizedBox(height: 30.h,),
              Padding(
                padding: EdgeInsets.only(left:25.w ),
                child: buildListView(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}