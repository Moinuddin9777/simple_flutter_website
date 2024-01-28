import 'package:api_call/app/core/utils/extensions.dart';
import 'package:api_call/app/data/models/product.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:flutter_ellipsis_text/flutter_ellipsis_text.dart';

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
        SizedBox(
          width: 2.0.wp,
        ),
        Container(
          height: 60.0.wp,
          width: 35.0.wp,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                color: Theme.of(context).colorScheme.secondaryContainer,
                offset: const Offset(10, 0),
              )
            ],
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage(product.imageLink),
              fit: BoxFit.contain,
            ),
          ),
        ),
        SizedBox(
          width: 2.0.wp,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                product.name,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                    ),
              ),
              SizedBox(
                height: 4.0.wp,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'category :',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                          ),
                    ),
                    Text(
                      ' ${product.category!}',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                          ),
                    ),
                  ],
                ),
              SizedBox(
                height: 5.0.wp,
              ),
              // if (product.description != null)
              //   EllipsisText(
              //     maxLines: 2,
              //     ellipsis: '...',
              //     text: product.description!,
              //     style: Theme.of(context).textTheme.labelLarge!.copyWith(
              //           color: Theme.of(context).colorScheme.onPrimaryContainer,
              //         ),
              //     textDirection: TextDirection.ltr,
              //   )
              // else
              //   Text(
              //     'Nothing to show',
              //     style: Theme.of(context).textTheme.bodySmall!.copyWith(
              //           fontSize: 15,
              //           color: Theme.of(context).colorScheme.onPrimaryContainer,
              //         ),
              //   ),
              // const SizedBox(
              //   height: 2.0.wp,
              // ),
              Row(
                children: [
                  SizedBox(
                    width: 3.0.wp,
                  ),
                  GestureDetector(
                    onTap: () async {
                      try {
                        if (await canLaunchUrl(
                            Uri.parse(product.websiteLink))) {
                          await launchUrl(Uri.parse(product.websiteLink));
                        }
                      } catch (err) {
                        debugPrint('couldnt launch..');
                      }
                    },
                    child: Text(
                      'Website Link',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            decoration: TextDecoration.underline,
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
                        debugPrint('couldnt launch..');
                      }
                    },
                    child: Text(
                      'Product Link',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                    ),
                  ),
                  SizedBox(
                    width: 5.0.wp,
                  ),
                ],
              ),
              SizedBox(
                height: 6.0.wp,
              ),
              Text(
                'Price :  ${product.price} $sign',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
