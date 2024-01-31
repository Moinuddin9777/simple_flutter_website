// ignore_for_file: deprecated_member_use, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_ellipsis_text/flutter_ellipsis_text.dart';
import 'package:assignment/APIs/products.dart';

class ProductView extends StatelessWidget {
  const ProductView({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    String sign = product.priceSign ?? '\$';

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
              // ignore: duplicate_ignore
              Text(
                product.name,
                textAlign: TextAlign.center,
                // ignore: deprecated_member_use
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontSize: 30,
                    ),
              ),
              const SizedBox(
                height: 20,
              ),
              if (product.category != null)
                Text(
                  'Category: ${product.category!}',
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
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
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      fontSize: 18,
                      color: Theme.of(context).colorScheme.onPrimary,
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
                        if (await canLaunch(product.websiteLink)) {
                          await launch(product.websiteLink);
                        }
                      } catch (err) {
                        // ignore: avoid_print
                        print('Could not launch: $err');
                      }
                    },
                    child: Text(
                      'Website Link',
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            decoration: TextDecoration.underline,
                            fontSize: 15,
                          ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () async {
                      try {
                        if (await canLaunch(product.productLink)) {
                          await launch(product.productLink);
                        }
                      } catch (err) {
                        // ignore: avoid_print
                        print('Could not launch: $err');
                      }
                    },
                    child: Text(
                      'Product Link',
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
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
                'Price: ${product.price} $sign',
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary,
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
