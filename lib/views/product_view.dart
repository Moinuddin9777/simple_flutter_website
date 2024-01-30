import 'package:flutter/material.dart';
import 'package:getxapi/models/product.dart';
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

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: NetworkImage(product.imageLink),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                      ),
                ),
                const SizedBox(height: 8),
                if (product.category != null)
                  Text(
                    'Category: ${product.category!}',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                          fontSize: 16,
                        ),
                  ),
                const SizedBox(height: 8),
                EllipsisText(
                  maxLines: 2,
                  ellipsis: '...',
                  text: product.description!,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                  textDirection: TextDirection.ltr,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        try {
                          if (await canLaunch(
                              Uri.parse(product.websiteLink).toString())) {
                            await launch(
                                Uri.parse(product.websiteLink).toString());
                          }
                        } catch (err) {
                          debugPrint('Could not launch website link');
                        }
                      },
                      child: Text(
                        'Website',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              decoration: TextDecoration.underline,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () async {
                        try {
                          if (await canLaunch(
                              Uri.parse(product.productLink).toString())) {
                            await launch(
                                Uri.parse(product.productLink).toString());
                          }
                        } catch (err) {
                          debugPrint('Could not launch product link');
                        }
                      },
                      child: Text(
                        'Product',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              decoration: TextDecoration.underline,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Price: ${product.price} $sign',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
