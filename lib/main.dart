import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_flutter_website/bloc/theme/theme_bloc.dart';
import 'package:simple_flutter_website/bloc/theme/theme_state.dart';
import 'package:simple_flutter_website/products/products_bloc.dart';
import 'package:simple_flutter_website/products/products_event.dart';
import 'package:simple_flutter_website/widgets/custom_app_bar.dart';
import 'package:simple_flutter_website/widgets/body_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var productsBloc = ProductsBloc();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: ((context) {
            return productsBloc
              ..add(
                LoadProductsEvent(),
              );
          }),
        ),
        BlocProvider(
          create: (context) => ThemeDataBloc(),
        )
      ],
      child: BlocBuilder<ThemeDataBloc, ThemeDataState>(
        builder: (context, state) {
          return MaterialApp(
            home: MyHomePage(),
            theme: state.theme,
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width  of our screen
    return Scaffold(
      body: Container(
        height: size.height,
        // it will take full width
        width: size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xff7b4397), Color(0xffdc2430)]),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Expanded(child: CustomAppBar()),
              ],
            ),
            Spacer(),
            // It will cover 1/3 of free spaces
            Body(),
            Spacer(
              flex: 2,
            ),
            // it will cover 2/3 of free spaces
          ],
        ),
      ),
    );
  }
}
