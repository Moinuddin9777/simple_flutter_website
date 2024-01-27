import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:api_call/models/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  RxString brand = ''.obs;
  ProductController(String value) {
    brand = RxString(value);
  }
  final products = [].obs;
  var isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
    loadProducts();
  }

  void loadProducts() async {
    String url =
        'http://makeup-api.herokuapp.com/api/v1/products.json?brand=$brand';
    Uri uri = Uri.parse(url);
    debugPrint('get started');
    final response = await http.get(uri);
    final body = response.body;
    json.decode(body).forEach(
      (e) async {
        if (await checkImageUrlStatus(e['image_link']) == true) {
          products.add(Product.fromJson(e));
        }
      },
    );
    debugPrint('get completed');
    isLoading.value = false;
  }

  Future<bool> checkImageUrlStatus(String url) async {
    try {
      final response = await http.head(Uri.parse(url));
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
}
