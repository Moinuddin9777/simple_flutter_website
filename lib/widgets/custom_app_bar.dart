import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              MyMenuItem(
                title: "Home",
                press: () {},
              ),
              MyMenuItem(
                title: "about",
                press: () {},
              ),
              MyMenuItem(
                title: "Pricing",
                press: () {},
              ),
              MyMenuItem(
                title: "Contact",
                press: () {},
              ),
              MyMenuItem(
                title: "Login",
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
    );
  }
}
