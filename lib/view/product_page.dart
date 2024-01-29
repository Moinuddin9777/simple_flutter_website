import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:makeup_api_app/controller/product_Controller.dart';
import 'package:makeup_api_app/view/home_page.dart';
import 'package:makeup_api_app/view/product_tile.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key, required this.selectedBrand});
  final String selectedBrand;
  //final ProductController controller = Get.put(ProductController(selectedBrand));

  @override
  Widget build(BuildContext context) {
    final ProductController productController =
        Get.put(ProductController(selectedBrand));
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(253, 177, 216, 1.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        centerTitle: true,
        title: const Text(
          'Products Page',
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back_ios,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          onTap: () => Get.to(HomePage()),
        ),
      ),
      body: Column(
        children: [
          //Discover your Favorite products text
          Padding(
            padding: const EdgeInsets.all(10),
            child: RichText(
              text: const TextSpan(
                style: TextStyle(fontSize: 35),
                children: [
                  TextSpan(
                    text: 'Discover your ',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  TextSpan(
                    text: 'Favorite ',
                    style: TextStyle(
                      color: Color.fromRGBO(253, 177, 216, 1.0),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: 'products !!',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ],
              ),
            ),
          ),

          //row of products category buttons
          GetBuilder<ProductController>(
            init: productController,
            builder: (controller) {
              return Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.categories.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 3, right: 3),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor:
                              const Color.fromRGBO(26, 26, 26, 1.0),
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: const BorderSide(
                                width: 1,
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        ),
                        child: Text(
                          controller.categories[index],
                          style: const TextStyle(
                            color: Colors.white,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),

          //product tiles.
          Expanded(
            child: GetBuilder<ProductController>(
              init: ProductController(selectedBrand),
              builder: (controller) {
                if (controller.isLoaded) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.productList?.length ?? 0,
                    itemBuilder: (context, index) {
                      var product = controller.productList![index];
                      return ProductTile(product: product);
                    },
                  );
                } else {
                  // Display a loading indicator or other UI when data is not yet loaded
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
