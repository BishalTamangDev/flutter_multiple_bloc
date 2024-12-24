import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiple_bloc/features/home/bloc/home_bloc.dart';
import 'package:multiple_bloc/features/profile/ui/profile.dart';
import 'package:multiple_bloc/features/search/ui/search.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var homeBloc = HomeBloc();

  var searchController = TextEditingController();

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
        } else if (state is HomeNavigateToSearchState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Search(searchTitle: state.searchText),
            ),
          );
        } else if (state is HomeEmptyTextFieldState) {
          if (ScaffoldMessenger.of(context).mounted) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          }
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text("Please enter a text search."),
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
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    spacing: 16.0,
                    children: [
                      const SizedBox(height: 32.0),
                      Row(
                        spacing: 16.0,
                        children: [
                          Expanded(
                            child: TextField(
                              controller: searchController,
                              autofocus: false,
                              decoration: InputDecoration(
                                filled: true,
                                hintText: "Search here..",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32.0),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              if (searchController.text.isNotEmpty) {
                                //   navigate to search page
                                homeBloc.add(
                                  HomeNavigateToSearchEvent(
                                    searchTitle:
                                        searchController.text.toString(),
                                  ),
                                );
                              } else {
                                homeBloc.add(HomeEmptyTextFieldEvent());
                              }
                            },
                            icon: Icon(Icons.search),
                          ),
                        ],
                      ),
                      OutlinedButton(
                        onPressed: () {
                          homeBloc.add(HomeNavigateToProfileEvent());
                        },
                        child: const Text("Profile Page"),
                      ),
                    ],
                  ),
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
