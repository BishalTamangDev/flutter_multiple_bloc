part of 'search_bloc.dart';

@immutable
sealed class SearchEvent {}

class SearchInitialEvent extends SearchEvent{
  final String searchTitle;
  SearchInitialEvent({required this.searchTitle});
}