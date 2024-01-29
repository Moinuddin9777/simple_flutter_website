import 'package:http/http.dart' as http;
import 'package:makeup_api_app/model/product_model.dart';

class RemoteServices {
  static var client = http.Client();

  static Future<List<Product>?> fetchProducts(String brand) async {
    var response = await client.get(Uri.parse(
        'https://makeup-api.herokuapp.com/api/v1/products.json?brand=$brand'));

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productFromJson(jsonString);
    } else {
      // Handle the error here
      print('Failed to load products');
      throw Exception('Failed to load products');
    }
  }
}
