import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_flutter_website/UI/views/about_page.dart';
import 'package:simple_flutter_website/UI/views/contact_page.dart';
import 'package:simple_flutter_website/UI/views/data_page.dart';
import 'package:simple_flutter_website/main.dart';
import 'package:simple_flutter_website/themes.dart';
import '../widgets/menu_item.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 7, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(46),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -2),
              blurRadius: 30,
              color: Colors.black.withOpacity(0.25),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Flexible(
            fit: FlexFit.tight,
            child: Row(
              children: [
                Image.network(
                  "https://t4.ftcdn.net/jpg/03/75/38/73/360_F_375387396_wSJM4Zm0kIRoG7Ej8rmkXot9gN69H4u4.jpg",
                  height: 25,
                  alignment: Alignment.topCenter,
                ),
                SizedBox(width: 5),
                Text(
                  "Simple Site".toUpperCase(),
                  style: headlineTextStyle,
                ),
                const Spacer(),
                MyMenuItem(
                  title: "Home",
                  press: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyHomePage()));
                  },
                ),
                MyMenuItem(
                  title: "about",
                  press: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AboutPage()));
                  },
                ),
                MyMenuItem(
                  title: "Data",
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DataPage()),
                    );
                  },
                ),
                MyMenuItem(
                  title: "Contact",
                  press: () {
                    Navigator.pop(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ContactPage()));
                  },
                ),
                MyMenuItem(
                  title: "Work",
                  press: () {},
                ),
                IconButton(
                  icon: Icon(CupertinoIcons.search),
                  // child: Text("Get Started"),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
