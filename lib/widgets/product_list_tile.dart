import 'package:ecommerce_app/config/presentation/app_color.dart';
import 'package:flutter/material.dart';

class ProductListAndCartTile extends StatelessWidget {
  final String type;
  final String imageUrl;
  final String productName;
  final String productAmount;
  final String totalPrice;
  final VoidCallback onTap;
  final VoidCallback onTapIncrement;
  final VoidCallback onTapDecrement;
  final VoidCallback onTapImage;
  const ProductListAndCartTile({
    Key? key,
    required this.type,
    required this.imageUrl,
    required this.productName,
    required this.productAmount,
    required this.totalPrice,
    required this.onTap,
    required this.onTapIncrement,
    required this.onTapDecrement,
    required this.onTapImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var leftContainerWidth = width * (3 / 10);
    var rightContainerWidth = width * (7 / 10);
    return Column(
      children: [
        SizedBox(
          width: width,
          height: 100,
          child: Row(
            children: [
              InkWell(
                onTap: () => onTapImage(),
                child: SizedBox(
                  width: leftContainerWidth,
                  child: Image.network(
                    imageUrl,
                    errorBuilder: (context, object, stacktrace) {
                      return Container();
                    },
                  ),
                ),
              ),
              SizedBox(
                width: rightContainerWidth,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 35,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: rightContainerWidth * 0.70 - 8,
                              child: Text(
                                productName,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                            ),
                            IconButton(
                              icon: type == 'cart'
                                ? const Icon(Icons.shopping_cart_rounded, color: Colors.green)
                                : const Icon(Icons.delete, color: Colors.red),
                              onPressed: () => onTap(),
                            ),
                          ],
                        ),
                      ),
                      const Text("Quantity"),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 30,
                            width: 100,
                            decoration: const BoxDecoration(
                              // border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.all(Radius.circular(25)),
                              gradient: AppColor.buttonGradient,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                  child: const Icon(Icons.remove, color: Colors.white, size: 20),
                                  onTap: () => onTapDecrement(),
                                ),
                                Text(productAmount, style: const TextStyle(color: Colors.white)),
                                InkWell(
                                  child: const Icon(Icons.add, color: Colors.white, size: 20),
                                  onTap: () => onTapIncrement(),
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            child: Text(
                              totalPrice,
                              style: const TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(color: Colors.grey[200], height: 2, thickness: 5),
      ],
    );
  }
}
