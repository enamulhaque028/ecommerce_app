import 'package:ecommerce_app/screens/tabs/category/bloc/product_category_bloc.dart';
import 'package:ecommerce_app/screens/tabs/category/data/repositories/product_category_repository.dart';
import 'package:ecommerce_app/screens/tabs/category/product_list_page.dart';
import 'package:ecommerce_app/widgets/product_category_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return BlocProvider(
      create: (context) => ProductCategoryBloc(
        RepositoryProvider.of<ProductCategoryRepository>(context),
      )..add(LoadProductCategoryEvent()),
      child: BlocBuilder<ProductCategoryBloc, ProductCategoryState>(
        builder: (context, state) {
          if (state is ProductCategoryLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ProductCategoryLoadedState) {
            var categoryList = state.productCategory.category!;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isPortrait ? 2 : 3,
                childAspectRatio: isPortrait ? 1.0 : 1.8,
              ),
              itemCount: categoryList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProductListPage(),
                        ),
                      );
                    },
                    child: ProductCategoryTile(
                      name: categoryList[index].categoryName!,
                      imageUrl: categoryList[index].image!,
                    ),
                  ),
                );
              },
            );
          }
          if (state is ProductCategoryErrorState) {
            return Center(
              child: Text(state.error.toString()),
            );
          }
          return Container();
        },
      ),
    );
  }
}
