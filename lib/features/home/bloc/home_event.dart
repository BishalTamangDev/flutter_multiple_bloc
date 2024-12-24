part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeEmptyTextFieldEvent extends HomeEvent {}

// navigation
class HomeNavigateToProfileEvent extends HomeEvent {}

class HomeNavigateToSearchEvent extends HomeEvent {
  final String searchTitle;

  HomeNavigateToSearchEvent({required this.searchTitle});
}
