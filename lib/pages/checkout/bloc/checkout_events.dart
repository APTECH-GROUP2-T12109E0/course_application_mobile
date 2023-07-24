import '../../../common/entities/course.dart';
import '../../../common/entities/user.dart';

abstract class CheckoutDetailEvents{
  const CheckoutDetailEvents();
}

class TriggerCheckoutDetail extends CheckoutDetailEvents{
  const TriggerCheckoutDetail(this.courseItem):super();
  final CourseItem courseItem;
  // final UserProfile? userProfile;

}