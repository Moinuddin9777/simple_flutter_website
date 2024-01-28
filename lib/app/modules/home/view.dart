import 'package:api_call/app/core/utils/extensions.dart';
import 'package:api_call/app/modules/home/widgets/brand_view.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MakeUp Products',
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            BrandView(),
            Container(
              height: 100.0.wp,
              width: 80.0.wp,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: AssetImage('assets/images/makeup.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 8.0.wp,
            ),
            Center(
              child: Text(
                'Good makeup, Good mood',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
