import 'package:get/get.dart';
import 'package:simple_flutter_website/app/api/api_service.dart';
import 'package:simple_flutter_website/app/models/product.dart';
import 'package:http/http.dart' as http;

class ProductController extends GetxController {
  var isLoading = true;
  List<Product> productList = [];
  String currBrand = "colourpop";

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    isLoading = true;
    update();
    productList = [];
    var products = await ApiService.fetchProducts(currBrand);

    if (products != null) {
      products.forEach((element) async {
        var res = await http.get(Uri.parse(element.imageLink));
        if (res.statusCode == 200) {
          productList.add(element);
          update();
        }
      });
    }
    isLoading = false;

    update();
  }
}
