import 'package:ecommerce_app/config/presentation/app_color.dart';
import 'package:ecommerce_app/screens/tabs/cart/cart_page.dart';
import 'package:ecommerce_app/screens/tabs/category/category_page.dart';
import 'package:ecommerce_app/screens/tabs/profile/profile_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Smart Shop'),
          leading: const Icon(Icons.menu),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: AppColor.appBarGradient,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          ],
          centerTitle: true,
          bottom: const TabBar(
            padding: EdgeInsets.all(8),
            indicator: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              color: Colors.blue,
            ),
            tabs: [
              Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Category'),
                ),
              ),
              Center(child: Text('Cart')),
              Center(child: Text('Profile')),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            CategoryPage(),
            CartPage(),
            ProfilePage(),
          ],
        ),
      ),
    );
  }
}
