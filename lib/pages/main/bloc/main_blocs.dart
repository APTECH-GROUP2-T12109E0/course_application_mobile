import 'package:flutter_bloc/flutter_bloc.dart';

import 'main_evens.dart';
import 'main_state.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState>{
  MainScreenBloc():super(MainScreenState()){
    on<MainScreenEvent>((event, emit){
      emit(MainScreenState(page:state.page));
    });
  }

}