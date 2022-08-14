import 'package:flutter/material.dart';
import 'package:shoes_app/widgets/widgets.dart';

class AddCart extends StatelessWidget {
  final double price;
  const AddCart({Key? key, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        width: double.infinity,
        height: 90,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.15),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          children: [
            const SizedBox(width: 20),
            Text(
              '\$$price',
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            ButtonCart(
              title: 'Add to Cart',
            ),
            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
