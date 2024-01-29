import 'package:flutter/material.dart';
import 'package:makeup_api_app/model/product_model.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    bool isEnabled = true;
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Container(
        margin: const EdgeInsets.only(left: 20),
        width: 280,
        height: 500,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 26, 26, 26),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            // Image
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    width: 1.0,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    product.imageLink,
                    fit: BoxFit.cover,
                    width: 100,
                    height: 170,
                    errorBuilder: (context, error, StackTrace) {
                      isEnabled = false;
                      return Container(
                        color: const Color.fromRGBO(26, 26, 26, 1.0),
                        width: 100,
                        height: 170,
                        child: const Icon(
                          Icons.image_not_supported_outlined,
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

            //product information container
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromRGBO(26, 26, 26, 1.0),
                ),
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    //Product name
                    Text(
                      product.name,
                      style: const TextStyle(
                        color: Color.fromRGBO(253, 177, 216, 1.0),
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.visible,
                    ),

                    //product description
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        product.description,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        maxLines: 4,
                        overflow: TextOverflow.fade,
                      ),
                    ),

                    const Spacer(),

                    //row (price + add to cart button)
                    //price of the product
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Text(
                            '\$${product.price}',
                            style: const TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                      
                          const Spacer(),
                      
                          // add to cart button
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              foregroundColor: const Color.fromARGB(255, 255, 255, 255), backgroundColor: const Color.fromRGBO(253, 177, 216, 1.0),
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                side: const BorderSide(
                                  width: 1,
                                  color: Colors.white,
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 25.0,
                              ),
                            ),
                            child: const Text(
                              'Add to cart',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
