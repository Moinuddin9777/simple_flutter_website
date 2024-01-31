
import 'package:flutter/material.dart';
import 'package:assignment/pages/home_page/home_screen2.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'MakeUp Stuff',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 45,
              ),
        ),
      ),
      body: const BrandView(),
    );
  }
}
