import 'dart:developer';
import 'package:bloc/bloc.dart';

import '../../config/utils/constants.dart';
import '../../core/network/http_client.dart';
import '../../screens/tabs/category/product_list/bloc/product_list_bloc.dart';
import '../models/product_list.dart';

class ProductListRepository {
  ProductListRepository({required this.baseClient});
  final BaseHttpClient baseClient;

  int currentPage = 1;
  List<Result>? productList = [];
  String nextPage = '';
  bool hasReachMax = false;

  Future<List<Result>?> getProductList({bool isRefresh = false, required Emitter<ProductListState> emit}) async {
    if (isRefresh) {
      currentPage = 1;
      hasReachMax = false;
    } else {
      if (nextPage == 'null') {
        hasReachMax = true;
        emit(ProductListLoadedState(productList: productList!, enablePullUp: false));
      }
    }

    String url = "${Constants.baseUrl}/api/v1/products/?product_category=ToysAndCollectibles&page=$currentPage";
    log(url);
    if (!hasReachMax) {
      final response = await baseClient.authenticatedClient.get(url);
      log('${response.statusCode}::::::::::::::::::::::::::::::$hasReachMax');
      if (response.statusCode == 200) {
        final result = productListFromJson(response.data);
        if (isRefresh) {
          productList = result.results!;
        } else {
          productList!.addAll(result.results!);
        }
        currentPage++;
        nextPage = result.next.toString();
        log('::::::::::::::::::::::::::::::::::::::::::::$nextPage');
        return productList;
      } else {
        throw Exception("Failed to load product list");
      }
    } else {
      log('--------------------------max reached');
      return productList;
    }
  }
}
