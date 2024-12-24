import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiple_bloc/features/home/bloc/home_bloc.dart';
import 'package:multiple_bloc/features/profile/ui/profile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var homeBloc = HomeBloc();

  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToProfileState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Profile(),
            ),
          );
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(
              appBar: AppBar(
                title: const Text("Home"),
                centerTitle: true,
              ),
              body: const Center(
                child: Column(
                  spacing: 16.0,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(),
                    Text("Loading home page"),
                  ],
                ),
              ),
            );
          case HomeLoadingSuccessState:
            return Scaffold(
              appBar: AppBar(
                title: const Text("Home"),
                centerTitle: true,
              ),
              body: Center(
                child: Column(
                  spacing: 16.0,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("Home page loaded successfully."),
                    OutlinedButton(
                      onPressed: () {
                        homeBloc.add(HomeNavigateToProfileEvent());
                      },
                      child: const Text("Profile Page"),
                    ),
                  ],
                ),
              ),
            );
          case HomeLoadingFailureState:
            return Scaffold(
              appBar: AppBar(
                title: const Text("Home"),
                centerTitle: true,
              ),
              body: Center(
                child: Column(
                  spacing: 16.0,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("Error in loading homepage."),
                    OutlinedButton(
                      onPressed: () {
                        homeBloc.add(HomeInitialEvent());
                      },
                      child: const Text("Refresh"),
                    ),
                  ],
                ),
              ),
            );
          default:
            return Scaffold(
              appBar: AppBar(
                title: const Text("Home"),
                centerTitle: true,
              ),
              body: const Center(
                child: Column(
                  spacing: 16.0,
                  mainAxisSize: MainAxisSize.min,
                  children: [],
                ),
              ),
            );
        }
      },
    );
  }
}
