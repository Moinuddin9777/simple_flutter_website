import 'package:flutter/material.dart';
import 'package:simple_flutter_website/themes.dart';

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
    return InkWell(
      onTap: () => press(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          title.toUpperCase(),
          style: subtitleBold,
        ),
      ),
    );
  }
}
