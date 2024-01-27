import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:assignment/pages/product_page/product_screen2.dart';
import 'package:assignment/pages/product_page/controller.dart';

class Products extends StatelessWidget {
  late final ProductController ctrl;
  final String brand;

  // ignore: use_key_in_widget_constructors
  Products({Key? key, required this.brand}) {
    ctrl = ProductController(brand);
    ctrl.loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          brand,
          // ignore: deprecated_member_use
          style: Theme.of(context).textTheme.headline5!.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 35,
          ),
        ),
      ),
      body: Obx(
        () {
          if (ctrl.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: ctrl.products.length,
              itemBuilder: (ctx, index) => Card(
                color: Theme.of(context).colorScheme.secondary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ProductView(
                  product: ctrl.products[index],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
