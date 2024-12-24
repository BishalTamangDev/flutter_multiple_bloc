import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiple_bloc/features/search/bloc/search_bloc.dart';

class Search extends StatefulWidget {
  const Search({super.key, required this.searchTitle});

  final String searchTitle;

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var searchBloc = SearchBloc();

  @override
  void initState() {
    searchBloc.add(SearchInitialEvent(searchTitle: widget.searchTitle));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchBloc, SearchState>(
      bloc: searchBloc,
      listenWhen: (previous, current) => current is SearchActionState,
      buildWhen: (previous, current) => current is! SearchActionState,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case SearchingState:
            var tempState = state as SearchingState;

            return Scaffold(
              appBar: AppBar(
                title: const Text("Search"),
                centerTitle: true,
              ),
              body: Center(
                child: Column(
                  spacing: 16.0,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(),
                    Text("Searching for ${tempState.searchTitle}"),
                  ],
                ),
              ),
            );
          case SearchedSuccessState:
            var tempState = state as SearchedSuccessState;
            return Scaffold(
              appBar: AppBar(
                title: const Text("Search"),
                centerTitle: true,
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    spacing: 16.0,
                    children: [
                      const SizedBox(height: 16.0),
                      Text(
                        "Search result for ${tempState.searchTitle}",
                        style: Theme
                            .of(context)
                            .textTheme
                            .headlineSmall,
                      ),
                    ],
                  ),
                ),
              ),
            );

          default:
            return Scaffold(
              appBar: AppBar(
                title: const Text("Search"),
                centerTitle: true,
              ),
              body: const Center(
                child: Text("Error occurred during search."),
              ),
            );
        }
      },
    );
  }
}
