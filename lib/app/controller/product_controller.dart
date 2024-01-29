import 'package:get/get.dart';
import 'package:simple_flutter_website/app/api/api_service.dart';
import 'package:simple_flutter_website/app/models/product.dart';

class ProductController extends GetxController {
  var isLoading = true;
  List<Product> productList = [];
  String currBrand = "marcelle";

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    isLoading = true;
    update();

    var products = await ApiService.fetchProducts(currBrand);
    productList = products;
    isLoading = false;

    update();
  }
}
