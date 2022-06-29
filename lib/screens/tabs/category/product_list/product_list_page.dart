import 'package:ecommerce_app/screens/tabs/category/product_details_page.dart';
import 'package:ecommerce_app/widgets/product_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../../core/network/http_client.dart';
import '../../../../data/repositories/product_list_repository.dart';
import 'bloc/product_list_bloc.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  late final RefreshController _refreshController;

  @override
  void initState() {
    _refreshController = RefreshController(initialRefresh: false);
    super.initState();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  void _onLoading(BuildContext context) {
    BlocProvider.of<ProductListBloc>(context).add(LoadMoreProductListEvent());
  }

  void _onRefresh(BuildContext context) {
    BlocProvider.of<ProductListBloc>(context).add(RefreshProductListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Collections'),
        centerTitle: true,
      ),
      body: RepositoryProvider(
        create: (context) => ProductListRepository(
          baseClient: sl.get<BaseHttpClient>(),
        ),
        child: BlocProvider(
          create: (context) => ProductListBloc(
            RepositoryProvider.of<ProductListRepository>(context),
          )..add(LoadProductListEvent()),
          child: BlocConsumer<ProductListBloc, ProductListState>(
            listener: (context, state) {
              if (state is ProductListRefreshCompleteState || state is ProductListLoadMoreCompleteState) {
                _refreshController
                  ..loadComplete()
                  ..refreshCompleted();
              }
            },
            builder: (context, state) {
              if (state is ProductListLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is ProductListLoadedState) {
                return SmartRefresher(
                  controller: _refreshController,
                  enablePullUp: state.enablePullUp,
                  onRefresh: () => _onRefresh(context),
                  onLoading: () => _onLoading(context),
                  child: ListView.builder(
                    itemCount: state.productList.length,
                    itemBuilder: (context, index) {
                      var productInfo = state.productList[index];
                      return ProductListAndCartTile(
                        type: 'cart',
                        imageUrl: productInfo.productImgLg!,
                        productName: productInfo.productName!,
                        productAmount: productInfo.productQuantity.toString(),
                        totalPrice: '৳${productInfo.productPrice.toString()}',
                        onTap: () {},
                        onTapIncrement: () {},
                        onTapDecrement: () {},
                        onTapImage: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailsPage(
                                imgUrl: productInfo.productImgLg!,
                                title: productInfo.productName!,
                                description: productInfo.productDesc!,
                                price: '৳${productInfo.productPrice!}',
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                );
              }
              if (state is ProductListErrorState) {
                return Center(
                  child: Text(state.error.toString()),
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
