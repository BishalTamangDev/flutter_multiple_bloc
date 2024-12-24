import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeNavigateToProfileEvent>(homeNavigateToProfileEvent);
  }

  // initial event
  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    Random().nextBool()
        ? emit(HomeLoadingSuccessState())
        : emit(HomeLoadingFailureState());
  }

//   navigate to profile page
  homeNavigateToProfileEvent(
      HomeNavigateToProfileEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToProfileState());
  }
}
