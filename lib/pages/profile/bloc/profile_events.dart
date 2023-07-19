import 'package:course_application_mobile/common/entities/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class ProfileEvents{
  const ProfileEvents();

}

class TriggerProfileName extends ProfileEvents{
  final UserProfile userProfile;
  const TriggerProfileName(this.userProfile);
}