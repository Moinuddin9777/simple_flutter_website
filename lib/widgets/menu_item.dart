import 'package:flutter/material.dart';
import 'package:simple_flutter_website/themes.dart';
import 'package:simple_flutter_website/utils/theme.dart';

class MyMenuItem extends StatelessWidget {
  final String title;
  final Function press;
  const MyMenuItem({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: () => press(),
        child: Text(
          title.toUpperCase(),
          style: subtitleBold.copyWith(
            color: Colors.deepPurple,
          ),
        ),
      ),
    );
  }
}
