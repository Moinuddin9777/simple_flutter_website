
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:assignment/APIs/brands.dart';

class HomeController extends GetxController {
  final textEditingController = TextEditingController();
  final brandList = brands;

  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
  }
}
