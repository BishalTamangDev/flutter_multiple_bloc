part of 'search_bloc.dart';

@immutable
sealed class SearchState {}

// action state
abstract class SearchActionState extends SearchState {}

final class SearchInitial extends SearchState {}

// searching
class SearchingState extends SearchState {
  final String searchTitle;

  SearchingState({required this.searchTitle});
}

// search :: success
class SearchedSuccessState extends SearchState {
  final String searchTitle;

  SearchedSuccessState({required this.searchTitle});
}

// search :: failure
class SearchedFailureState extends SearchState {
  final String searchTitle;

  SearchedFailureState({required this.searchTitle});
}
