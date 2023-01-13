import 'package:flutter/material.dart';
import 'package:simple_flutter_website/themes.dart';
import 'package:simple_flutter_website/widgets/custom_app_bar.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        CustomAppBar(),
        Center(
          child: Text(
            "ABOUT PAGE UNDER DEV",
            style: headlineTextStyle,
          ),
        )
      ]),
    );
  }
}
