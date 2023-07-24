import 'package:flutter_bloc/flutter_bloc.dart';

import 'checkout_events.dart';
import 'checkout_states.dart';

class CheckoutDetailBloc extends Bloc<CheckoutDetailEvents, CheckoutDetailStates> {
  CheckoutDetailBloc() :super(const CheckoutDetailStates()) {
    on<TriggerCheckoutDetail>(_triggerCheckoutDetail);

  }

  void _triggerCheckoutDetail(TriggerCheckoutDetail event,
      Emitter<CheckoutDetailStates>emit) {
    emit(state.copyWith(courseItem: event.courseItem));
  }
}