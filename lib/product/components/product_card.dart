import 'package:flutter/material.dart';

import '../../helper/helpers.dart';
import '../data/model/models.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Container(
      height: 150.0,
      width: size.width,
      padding: const EdgeInsets.symmetric(
          horizontal: 10.0, vertical: 20.0),
      decoration: BoxDecoration(
          color: Colors.green.withOpacity(0.05),
          borderRadius: BorderRadius.circular(12.0)),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: 110.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  image: DecorationImage(
                      image: NetworkImage(product.thumbnail),
                      fit: BoxFit.cover)),
            ),
          ),
          const SizedBox(width: 10.0),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                TextFormatter. reduceTextLength(product.title, 30),
                  style: const TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 4.0),
                Text(
                 TextFormatter. reduceTextLength(product.description, 78),
                  style: const TextStyle(fontSize: 10.0),
                ),
                const SizedBox(height: 4.0),
                Text(
                  '\$${TextFormatter.formatCurrency.format(product.price)}',
                  style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.green),
                ),
                const SizedBox(height: 2.0),
                Row(
                    children: List.generate(
                        product.rating.round(),
                            (int index) => const Icon(
                          Icons.star_rate,
                          size: 12.0,
                          color: Colors.amber,
                        )))
              ],
            ),
          )
        ],
      ),
    );
  }
}
