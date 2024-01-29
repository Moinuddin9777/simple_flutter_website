
import 'package:brands/app/data/product.dart';
import 'package:brands/app/modules/product/controller/mycontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_ellipsis_text/flutter_ellipsis_text.dart';


class ProductView extends StatelessWidget {
  
  const ProductView({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    var sign = '';
    if (product.priceSign == null) {
      sign = '\$';
    } else {
      sign = '${product.priceSign}';
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          width: 20,
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 250,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(product.imageLink),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Text(
                product.name,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                    ),
              ),
              const SizedBox(
                height: 15,
              ),
              if (product.category != null)
                Text(
                  'Category : ${product.category!}',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                ),
              const SizedBox(
                height: 15,
              ),
              EllipsisText(
                maxLines: 2,
                ellipsis: '...',
                text: product.description!,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                textDirection: TextDirection.ltr,
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        if (await canLaunchUrl(
                            Uri.parse(product.websiteLink))) {
                          await launchUrl(Uri.parse(product.websiteLink));
                        }
                      } catch (err) {
                        // ignore: avoid_print
                        print('couldnt launch..');
                      }
                    },
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.black)),
                    child: Text(
                      'Website Link',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 15,
                            color: Colors.white
                          ),
                    ),
                  ),
                  const SizedBox(
                        width: 100,
                      ),
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        if (await canLaunchUrl(
                            Uri.parse(product.productLink))) {
                          await launchUrl(Uri.parse(product.productLink));
                        }
                      } catch (err) {
                        // ignore: avoid_print
                        print('couldnt launch..');
                      }
                    },
                   style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.black)),
                    child: Text(
                      'Product Link',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 15,
                            color: Colors.white
                          ),
                    ),
                  ),
                  
                  const Spacer(),
                  GetBuilder<mycontroller>(
                    init: mycontroller(),
                    builder: (ctrl){
                          return Text(
                            "${ctrl.count} items added",
                            style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                          ); 
                    }
                  ),
                  ElevatedButton(onPressed: (){
                    Get.find<mycontroller>().increment();
                  },
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.black)), 
                  child: Text('cart',style:Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 20,
                            color: Colors.white) ,))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'PRICE :  ${product.price}$sign',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                      fontSize: 20,
                    ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ],
    );
  }
}
