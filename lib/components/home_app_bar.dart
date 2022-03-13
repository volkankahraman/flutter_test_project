import 'package:flutter/material.dart';

AppBar homeAppBar() {
  return AppBar(
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
      const SizedBox(width: 10.0),
    ],
  );
}
