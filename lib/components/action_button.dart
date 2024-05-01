import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: 48.0,
      decoration:
      BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(12.0)),
      child: const Center(
        child: Text(
          'Add To Cart',
          style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w500,
              color: Colors.white),
        ),
      ),
    );
  }
}