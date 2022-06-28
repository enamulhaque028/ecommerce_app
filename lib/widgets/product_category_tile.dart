import 'package:flutter/material.dart';

class ProductCategoryTile extends StatelessWidget {
  final String name;
  final String imageUrl;
  const ProductCategoryTile({
    Key? key,
    required this.name,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: GridTile(
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
        footer: Container(
          padding: const EdgeInsets.all(8),
          color: Colors.grey.withOpacity(0.5),
          child: Center(
            child: Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
