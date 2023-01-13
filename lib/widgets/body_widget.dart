import 'package:flutter/material.dart';
import 'package:simple_flutter_website/themes.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Hey!, Welcome to this site",
            style: Theme.of(context).textTheme.headline2!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const Text(
            "This is a simple single page UI of a web page made with flutter",
            style: TextStyle(
              fontSize: 21,
              // color: kTextcolor.withOpacity(0.34),
            ),
          ),
          FittedBox(
            // Now it just take the required spaces
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Color(0xFF372930),
                borderRadius: BorderRadius.circular(34),
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                    height: 38,
                    width: 38,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 221, 221, 221),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Text("Get Started".toUpperCase(), style: subtitleBold),
                  SizedBox(width: 15),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
