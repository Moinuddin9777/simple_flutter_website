import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_flutter_website/bloc/photos/photos_bloc.dart';
import 'package:simple_flutter_website/bloc/photos/photos_state.dart';
import 'package:simple_flutter_website/products/products_bloc.dart';
import 'package:simple_flutter_website/products/products_state.dart';
import 'package:simple_flutter_website/widgets/custom_app_bar.dart';

class DataPage extends StatefulWidget {
  const DataPage({Key? key}) : super(key: key);

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ProductsLoadedState) {
          BlocProvider.value(
              value: BlocProvider.of<ProductsBloc>(context),
              child: const Card(
                child:
                    Center(child: Text('.............DATA LOADED............')),
              ));
          return Column(
            children: [
              CustomAppBar(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26.0),
                child: ListView.builder(
                    // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //   crossAxisCount: 3
                    // ),
                    shrinkWrap: true,
                    primary: true,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          leading: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                                height: 60,
                                width: 60,
                                child: Image.network(state
                                    .products[index].imageLink
                                    .toString())),
                          ),
                          title: Text(state.products[index].name.toString()),
                        ),
                      );
                    },
                    itemCount: state.products.length),
              ),
            ],
          );
        }
        return Container();
      },
    ));
  }
}
