import 'package:get/get.dart';
import 'package:makeup_api_app/model/product_model.dart';
import 'package:makeup_api_app/services/remote_service.dart';

class ProductController extends GetxController {
  List<Product>? productList;
  var isLoaded = false;
  List<String> categories = []; // New list to store unique category names

  ProductController(String selectedBrand) {
    getData(selectedBrand);
  }

  void getData(String selectedBrand) async {
    try {
      var products = await RemoteServices.fetchProducts(selectedBrand);
      if (products != null) {
        productList = products;
        categories = extractUniqueCategories(products); // Extract unique categories
        isLoaded = true;
        update();
      }
    } catch (e) {
      // Handle any errors, e.g., log or show a toast
      print('Error fetching products: $e');
    }
  }

  // Helper method to extract unique categories from the product list
  List<String> extractUniqueCategories(List<Product> products) {
    Set<String> uniqueCategories = Set<String>();
    for (var product in products) {
      uniqueCategories.add(product.category.toString().split('.')[1]);
    }
    print('Unique Categories: $uniqueCategories');
    return uniqueCategories.toList();
  }
}

