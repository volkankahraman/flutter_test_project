import 'package:flutter/material.dart';
import 'package:flutter_test_project/components/notched_bottom_bar.dart';
import 'package:flutter_test_project/components/post.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(children: const <Widget>[
          Post(),
          Post(),
          Post(),
          Post(),
          Post(),
        ]),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFFBDBDBD),
          onPressed: () {},
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
