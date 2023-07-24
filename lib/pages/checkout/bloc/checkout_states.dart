import 'package:course_application_mobile/common/entities/entities.dart';

class CheckoutDetailStates {

  final CourseItem? courseItem;
  // final UserProfile? userProfile;


  const CheckoutDetailStates({
    this.courseItem,
    // this.userProfile

  });

  CheckoutDetailStates copyWith(
      {CourseItem? courseItem,
        // UserProfile? userProfile,
      }) {
    return CheckoutDetailStates(
        courseItem: courseItem ?? this.courseItem,
        // userProfile: userProfile ?? this.userProfile,
    );

  }
}