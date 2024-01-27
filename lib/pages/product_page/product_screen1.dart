
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:assignment/pages/product_page/product_screen2.dart';
import 'package:assignment/pages/product_page/controller.dart';

class Products extends StatelessWidget {
  late final ProductController ctrl;
  final String brand;

  Products({super.key, required this.brand}) {
    ctrl = Get.put(ProductController(brand));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          brand,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 35,
              ),
        ),
      ),
      body: Obx(
        () => ctrl.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: ctrl.products.length,
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  borderOnForeground: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ProductView(
                    product: ctrl.products[index],
                  ),
                ),
              ),
      ),
    );
  }
}
