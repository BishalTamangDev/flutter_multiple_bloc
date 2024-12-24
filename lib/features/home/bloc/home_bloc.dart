import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeEmptyTextFieldEvent>(homeEmptyTextFieldEvent);
    on<HomeNavigateToProfileEvent>(homeNavigateToProfileEvent);
    on<HomeNavigateToSearchEvent>(homeNavigateToSearchEvent);
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

  homeNavigateToSearchEvent(
      HomeNavigateToSearchEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToSearchState(searchText: event.searchTitle));
  }

//   empty text field
  homeEmptyTextFieldEvent(
      HomeEmptyTextFieldEvent event, Emitter<HomeState> emit) {
    emit(HomeEmptyTextFieldState());
  }
}
