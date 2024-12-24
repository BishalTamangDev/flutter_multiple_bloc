part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadingSuccessState extends HomeState {}

class HomeLoadingFailureState extends HomeState {}

// action state
abstract class HomeActionState extends HomeState {}

class HomeEmptyTextFieldState extends HomeActionState {}

// navigation
class HomeNavigateToProfileState extends HomeActionState {}

class HomeNavigateToSearchState extends HomeActionState {
  final String searchText;

  HomeNavigateToSearchState({required this.searchText});
}
