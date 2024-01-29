import 'package:brands/app/data/product.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as https;
import 'dart:convert';


class Selectedbrand extends GetxController{
  var isLoading = true;
  String brand = '';
  Selectedbrand(String value) {
    brand = value; 
  }
  var count=0;
 increment(){
  count++;
  update();
 }
  final products = [];
  
  
  @override
  void onInit() {
    addProducts();
    super.onInit();
    
  }

  void addProducts() async {
    String link ='http://makeup-api.herokuapp.com/api/v1/products.json?brand=$brand';
    Uri uri = Uri.parse(link);
    final result = await https.get(uri);
    final body = result.body;
    json.decode(body).forEach(
      (value) async {
        if (await checkImageUrlStatus(value['image_link']) == true) {
          products.add(Product.fromJson(value));
          update();
        }
      },
    );
    isLoading = false;
  }

  Future<bool> checkImageUrlStatus(String link) async {
    try {
      final result = await https.head(Uri.parse(link));
      if(result.statusCode != 200){
       return false ;
      }
      return true;
    } catch (value) {
      return false;
    }
  }
}

