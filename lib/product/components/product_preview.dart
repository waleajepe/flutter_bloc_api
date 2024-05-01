import 'package:flutter/material.dart';

import '../../components/components.dart';
import '../../helper/helpers.dart';
import '../data/model/models.dart';

class ProductPreview extends StatelessWidget {
  const ProductPreview({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.55,
      width: size.width,
      padding: const EdgeInsets.all(20.0),
      decoration: const BoxDecoration(color: Colors.white),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.title,
                  style: const TextStyle(
                      fontSize: 12.0, fontWeight: FontWeight.w500),
                ),
                Text(
                  '\$${TextFormatter.formatCurrency.format(product.price)}',
                  style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.green),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 6.0),
              child: Divider(),
            ),
            Text(
              product.description,
              style: const TextStyle(fontSize: 10.0, height: 1.5),
            ),
            SizedBox(
              height: 250,
              child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: product.images.length,
                  itemBuilder: (BuildContext context, int index) {
                    final image = product.images[index];
                    return Container(
                      width: 250.0,
                      height: 250.0,
                      margin: const EdgeInsets.only(right: 6.0),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black12.withOpacity(0.3),
                              width: 0.5),
                          borderRadius: BorderRadius.circular(12.0),
                          image: DecorationImage(
                              image: NetworkImage(image), fit: BoxFit.cover)),
                    );
                  }),
            ),
            const SizedBox(
              height: 10.0,
            ),
            ActionButton(size: size)
          ],
        ),
      ),
    );
  }
}
