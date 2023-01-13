import 'package:flutter/material.dart';
import 'package:simple_flutter_website/widgets/custom_app_bar.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        CustomAppBar(),
        Center(
          child: Text(
            "CONTACT PAGE UNDER DEV",
            style: Theme.of(context).textTheme.headline2,
          ),
        )
      ]),
    );
  }
}
