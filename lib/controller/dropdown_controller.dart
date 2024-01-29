// dropdown_controller.dart
import 'package:get/get.dart';
import 'package:makeup_api_app/controller/product_Controller.dart';
import 'package:makeup_api_app/view/product_page.dart';

class DropdownController extends GetxController {
  String? selectedValue;

  void setSelectedValue(String value) {
    selectedValue = value;
    update();
  }

  void handleSearchIconClick() {
    if (selectedValue != null && selectedValue!.isNotEmpty) {
      String selectedBrand = selectedValue!;

      // Clear the existing ProductController instance
      Get.delete<ProductController>();

      // Initialize ProductController with the selected brand
      Get.put(ProductController(selectedBrand));

      // Navigate to ProductsPage with the selected brand
      Get.to(() => ProductsPage(selectedBrand: selectedBrand));
    } else {
      // Show an alert or snackbar indicating that a brand must be selected
      // You can use Get.snackbar or showDialog for this purpose
    }
  }
}
