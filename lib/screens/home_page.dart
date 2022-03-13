import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_project/blocs/bloc/post_bloc.dart';
import 'package:flutter_test_project/components/home_app_bar.dart';
import 'package:flutter_test_project/components/notched_bottom_bar.dart';
import 'package:flutter_test_project/components/post_card.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: homeAppBar(),
        body: BlocBuilder<PostBloc, PostState>(
          bloc: BlocProvider.of<PostBloc>(context),
          builder: (context, state) {
            if (state is PostErrorState) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Error while loading posts.\n ${state.error} ",
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.red, fontSize: 14.0),
                  ),
                ),
              );
            }
            if (state is PostLoadedState) {
              return LazyLoadScrollView(
                onEndOfPage: () {
                  BlocProvider.of<PostBloc>(context).add(PostLoaded());
                },
                scrollOffset: 50,
                child: ListView.builder(
                  itemCount: state.posts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return PostCard(
                      post: state.posts[index],
                      onDelete: () {
                        BlocProvider.of<PostBloc>(context).add(
                          PostDeleted(state.posts[index].id),
                        );
                      },
                    );
                  },
                ),
              );
            }
            if (state is PostLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return const Center(
              child: Text("Error"),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFFBDBDBD),
          onPressed: () {
            Navigator.pushNamed(context, "/add");
          },
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const NotchedBottomAppBar(),
      ),
    );
  }
}
