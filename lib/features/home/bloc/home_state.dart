part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadingSuccessState extends HomeState {}

class HomeLoadingFailureState extends HomeState {}

// action state
abstract class HomeActionState extends HomeState {}

// navigation
class HomeNavigateToProfileState extends HomeActionState {}
