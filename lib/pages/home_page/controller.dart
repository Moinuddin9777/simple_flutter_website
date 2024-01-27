import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:assignment/APIs/brands.dart';

class HomeController extends GetxController {
  final TextEditingController textEditingController = TextEditingController();
  final List<String> brandList = List<String>.from(brands);

  @override
  void onInit() {
    super.onInit();
    fetchBrands();
  }

  @override
  void onClose() {
    textEditingController.dispose();
    super.onClose();
  }

  void fetchBrands() {
    brandList.addAll(brands);
  }
}
