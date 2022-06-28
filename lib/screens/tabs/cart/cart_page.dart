import 'package:ecommerce_app/widgets/product_list_tile.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return ProductListAndCartTile(
              type: 'delete',
              imageUrl: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
              productName: 'productName',
              productAmount: '1',
              totalPrice: '125.5',
              onTap: () {},
              onTapIncrement: () {},
              onTapDecrement: () {},
              onTapImage: () {},
            );
          },
      ),
      bottomNavigationBar: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 40,
                  width: width / 2,
                  color: Colors.grey[300],
                  child: const Center(
                    child: Text(
                      'TK. 120',
                      style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                  width: width / 2,
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    onPressed: () {},
                    color: Colors.black,
                    child: const Text(
                      'CHECKOUT',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
