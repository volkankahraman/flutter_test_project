import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_project/blocs/bloc/post_bloc.dart';
import 'package:flutter_test_project/screens/add_post_form.dart';
import 'package:flutter_test_project/screens/home_page.dart';
import 'package:flutter_test_project/services/http_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => HttpService(),
        ),
      ],
      child: BlocProvider(
        create: (context) =>
            PostBloc(RepositoryProvider.of<HttpService>(context))
              ..add(PostLoaded()),
        child: MaterialApp(
          title: 'Flutter Test',
          theme: ThemeData(primarySwatch: Colors.purple),
          initialRoute: "/",
          routes: {
            "/": (context) => const HomePage(),
            "/add": (context) => const AddPostForm(),
          },
        ),
      ),
    );
  }
}
