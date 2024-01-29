import 'package:brands/app/modules/product/controller/selectedbrand.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:brands/app/modules/product/widgets/productview.dart';

class nextscreen extends StatelessWidget {
  late final Selectedbrand controller;
  final String brand;

  nextscreen({super.key, required this.brand}) {
    controller = Get.put((Selectedbrand(brand)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          brand.toUpperCase(),
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold 
              ),
        ),
        
      ),
      body: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/brush.jpg'),
            fit: BoxFit.cover, // Adjust fit as needed
          ),
        ),
        child:GetBuilder<Selectedbrand>(
        builder:(controller) => controller.isLoading
            ? const Center(child: CircularProgressIndicator())
            : Container(
              margin: const EdgeInsets.all(20),
              child: ListView.builder(
                itemCount:controller.products.length ,
                itemBuilder: (ctx, index) => Card(
                  color:const Color.fromARGB(255, 190, 114, 93).withOpacity(0.75),
                  borderOnForeground: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ProductView(
                    product: controller.products[index],
                  ),
                ),
              ),
            )
      ),
        
      ),
    );
  }
}
