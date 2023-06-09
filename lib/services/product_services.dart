import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:simple_flutter_website/core/service_helper.dart';
import 'package:simple_flutter_website/models/products/products_response.dart';
import 'package:simple_flutter_website/utils/constants.dart';

class ProductServices {
  static Future<ProductsResponse> fetchAllProducts() async {
    try {
      var dio = await getDio();
      var response = await dio.get(
        '${AppConstants.makeupAPI}products.json',
      );
      return ProductsResponse(
          success: true,
          message: "success",
          productData: ProductData.fromJson(response.data));
    } on DioError catch (e) {
      logger.printError(
        info: e.response!.data["message"],
      );
      return ProductsResponse(success: false, message: "failed");
    }
  }
}
