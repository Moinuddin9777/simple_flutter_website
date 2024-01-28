import 'package:api_call/app/data/models/brands.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final textEditingController = TextEditingController();
  final brandList = brands;
  String? selectedValue;

  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
  }

  void updateSelected(String? value) {
    selectedValue = value;
    update();
  }
}
