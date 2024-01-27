
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_ellipsis_text/flutter_ellipsis_text.dart';
import 'package:assignment/APIs/products.dart';
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
        Container(
          height: 275,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(
              image: NetworkImage(product.imageLink),
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                product.name,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                      fontSize: 30,
                    ),
              ),
              const SizedBox(
                height: 20,
              ),
              // Wrap(
              //   children: product.productColors
              //       .map(
              //         (e) => Container(
              //           width: 25.0,
              //           height: 25.0,
              //           decoration: BoxDecoration(
              //             shape: BoxShape.circle,
              //             color: Color(
              //               int.parse(
              //                 e.hexValue!.replaceFirst('#', '0xFF'),
              //               ),
              //             ),
              //           ),
              //         ),
              //       )
              //       .toList(),
              // ),
              if (product.category != null)
                Text(
                  'category : ${product.category!}',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        fontSize: 22,
                      ),
                ),
              const SizedBox(
                height: 20,
              ),
              EllipsisText(
                maxLines: 3,
                ellipsis: '...',
                text: product.description!,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 18,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                textDirection: TextDirection.ltr,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () async {
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
                    child: Text(
                      'Website Link',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            decoration: TextDecoration.underline,
                            fontSize: 15,
                          ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () async {
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
                    child: Text(
                      'Product Link',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            decoration: TextDecoration.underline,
                            fontSize: 15,
                          ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Price :  ${product.price} $sign',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                      fontSize: 25,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
