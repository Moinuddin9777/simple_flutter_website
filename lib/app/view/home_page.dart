import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_flutter_website/app/controller/product_controller.dart';
import 'package:simple_flutter_website/app/data.dart/brands.dart';
import 'package:simple_flutter_website/app/view/products_page.dart';
import 'package:google_fonts/google_fonts.dart';

ProductController controller = Get.put(ProductController());

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF9A7B6F),
      appBar: AppBar(
        title: Text(
          'Make Up Finder',
          style: GoogleFonts.poppins(),
        ),
        // automaticallyImplyLeading: false,
      ),
      body: GetBuilder<ProductController>(
        init: ProductController(),
        builder: (controller) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/homepagebg.png'),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(40),
                ),
                border: Border.all(width: 1.0, color: Colors.white70),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 5,
              ),
              child: DropdownButton<String>(
                dropdownColor: const Color(0xFF9A7B6F),
                underline: const SizedBox(),
                menuMaxHeight: 500,
                hint: Text(
                  'Select a brand',
                  style: GoogleFonts.poppins(),
                ),
                value: controller.currBrand,
                icon: const Icon(
                  Icons.arrow_drop_down_rounded,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(40),
                ),
                iconSize: 24,
                elevation: 16,
                style: GoogleFonts.poppins(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    controller.currBrand = newValue;
                    controller.fetchProducts();
                  }
                },
                items: brands.map<DropdownMenuItem<String>>(
                  (String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      alignment: Alignment.center,
                      child: Text(
                        value,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  Color(0xFF6D4C41),
                ),
              ),
              onPressed: () {
                Get.to(
                  () => ProductsPage(),
                );
              },
              child: Text(
                'Submit',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
