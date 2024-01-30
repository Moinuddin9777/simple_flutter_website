import 'package:getxapi/views/product_view.dart';
import 'package:getxapi/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Products extends StatelessWidget {
  late final ProductController control;
  final String brand;

  Products({Key? key, required this.brand}) {
    control = Get.put(ProductController(brand));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          brand,
          style: Theme.of(context).textTheme.headline5!.copyWith(
                color: Colors.black,
              ),
        ),
      ),
      body: GetBuilder<ProductController>(
        builder: (control) => control.isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: control.products.length,
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  elevation: 2,
                  margin: const EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ProductView(
                    product: control.products[index],
                  ),
                ),
              ),
      ),
    );
  }
}
