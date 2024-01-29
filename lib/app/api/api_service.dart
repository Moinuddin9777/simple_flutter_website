import 'package:http/http.dart' as http;
import 'package:simple_flutter_website/app/models/product.dart';

class ApiService {
  static var client = http.Client();

  static Future<List<Product>> fetchProducts(String brand) async {
    try {
      var response = await client.get(
        Uri.parse(
            'https://makeup-api.herokuapp.com/api/v1/products.json?brand=$brand'),
      );
      // print('https://makeup-api.herokuapp.com/api/v1/products.json?brand=$brand');
      print(response.statusCode);
      if (response.statusCode == 200) {
        // print(response.body);
        var jsonString = response.body;
        // print('requesting');
        var res = productFromJson(jsonString);
        print(res.toString());
        // print('responce received');
        return res;
      } else {
        print('Error: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Exception: $e');
      return [];
    }
  }
}
