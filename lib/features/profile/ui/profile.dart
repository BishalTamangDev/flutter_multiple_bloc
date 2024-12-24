import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiple_bloc/features/profile/bloc/profile_bloc.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // variables
  ProfileBloc profileBloc = ProfileBloc();

  var searchController = TextEditingController();

  @override
  void initState() {
    profileBloc.add(ProfileInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      bloc: profileBloc,
      listenWhen: (previous, current) => current is ProfileActionState,
      buildWhen: (previous, current) => current is! ProfileActionState,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case ProfileLoadingState:
            return Scaffold(
                appBar: AppBar(
                  title: const Text("Profile"),
                  centerTitle: true,
                ),
                body: Center(
                  child: Text("Loading profile page..."),
                ));
          case ProfileLoadingSuccessState:
            return Scaffold(
              appBar: AppBar(
                title: const Text("Profile"),
                centerTitle: true,
              ),
              body: const Center(
                child: Text("Profile page"),
              ),
            );
          case ProfileLoadingFailureState:
            return Scaffold(
              appBar: AppBar(
                title: const Text("Profile"),
                centerTitle: true,
              ),
              body: const Center(
                child: Text("Error in loading profile page"),
              ),
            );
          default:
            return Scaffold(
              appBar: AppBar(
                title: const Text("Profile"),
                centerTitle: true,
              ),
              body: const Center(
                child: Text("Error in loading profile page."),
              ),
            );
        }
      },
    );
  }
}
