import 'package:api_call/screens/product/Widgets/product_view.dart';
import 'package:api_call/screens/product/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                fontSize: 28,
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
