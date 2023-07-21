import 'package:course_application_mobile/common/entities/user.dart';

abstract class ProfileEvents{
  const ProfileEvents();

}

class TriggerProfileName extends ProfileEvents{
  final UserProfile userProfile;
  const TriggerProfileName(this.userProfile);
}