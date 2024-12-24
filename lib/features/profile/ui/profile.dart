import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiple_bloc/features/profile/bloc/profile_bloc.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ProfileBloc profileBloc = ProfileBloc();

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
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    spacing: 16.0,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 32.0),
                      Container(
                        width: double.maxFinite,
                        height: 200,
                        color: Colors.grey.shade100,
                      ),
                      const Text(
                        "Hello World!",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            );
          case ProfileLoadingFailureState:
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
