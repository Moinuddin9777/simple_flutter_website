import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_flutter_website/app/models/product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.prodDetails});
  final Product prodDetails;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          height: 200,
          width: 170,
          image: NetworkImage(prodDetails.imageLink),
          errorBuilder: (context, error, stackTrace) {
            return Container(
              height: 200,
              width: 170,
              child: const Icon(Icons.error_outline_rounded),
            );
          },
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          prodDetails.name,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            color: const Color(0xFF6D4C41),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        // const Spacer(),
        Text(
          prodDetails.description,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.poppins(color: Colors.black, fontSize: 10),
        ),
      ],
    );
  }
}
