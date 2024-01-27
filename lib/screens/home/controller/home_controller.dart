import 'package:api_call/models/brands.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final textEditingController = TextEditingController();
  final brandList = brands;

  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
  }
}
