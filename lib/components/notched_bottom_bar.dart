import 'package:flutter/material.dart';

class NotchedBottomAppBar extends StatelessWidget {
  const NotchedBottomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 8.0,
      color: Color(0xFF4F4F4F),
      child: SizedBox(
        height: 60,
      ),
    );
  }
}
