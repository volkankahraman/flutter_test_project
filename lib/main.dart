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
      theme: ThemeData(primarySwatch: Colors.blue),
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
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage("https://i.pravatar.cc/300"),
            ),
            title: Text("Jane Doe"),
            subtitle: Text(
              "@janedoe_29",
              style: TextStyle(
                color: Color(0xFFA3A3A3),
              ),
            ),
          ),
          actions: [
            IconButton(
              constraints: const BoxConstraints(maxWidth: 30.0),
              onPressed: () {},
              icon: const Icon(
                Icons.search_rounded,
                size: 28.0,
                color: Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
            ),
            SizedBox(width: 10.0),
          ],
        ),
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
