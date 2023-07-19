import 'package:course_application_mobile/common/entities/user.dart';

class ProfileStates{
  final UserProfile? userProfile;
  const ProfileStates({this.userProfile});

  ProfileStates copyWith({UserProfile? userProfile}){
    return ProfileStates(userProfile: userProfile??this.userProfile);
  }
}