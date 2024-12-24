part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileLoadingSuccessState extends ProfileState {}

class ProfileLoadingFailureState extends ProfileState {}

// action state
abstract class ProfileActionState extends ProfileState {}
