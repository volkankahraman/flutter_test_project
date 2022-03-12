import 'package:flutter/material.dart';

class IconTextButton extends StatelessWidget {
  const IconTextButton(
      {Key? key, required this.text, required this.icon, required this.onPress})
      : super(key: key);
  final String text;
  final Icon icon;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Row(
        children: <Widget>[
          icon,
          const SizedBox(width: 3.0),
          Text(
            text,
            style: const TextStyle(
              fontSize: 12.0,
              color: Color(0xFFA3A3A3),
            ),
          )
        ],
      ),
    );
  }
}
