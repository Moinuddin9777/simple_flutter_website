import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:assignment/APIs/products.dart';

class ProductController extends GetxController {
  String brand = '';
  List<Product> products = [];
  bool isLoading = true;

  ProductController(String value) {
    brand = value;
  }

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
    final decodedData = json.decode(body);
    for (var item in decodedData) {
      if (await checkImageUrlStatus(item['image_link'])) {
        products.add(Product.fromJson(item));
      }
    }
    debugPrint('get completed');
    isLoading = false;
    update();
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
