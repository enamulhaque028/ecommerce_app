import 'dart:developer';

import '../../../../../core/network/http_client.dart';
import '../models/product_category.dart';

class ProductCategoryRepository {
  ProductCategoryRepository({required this.baseClient});
  final BaseHttpClient baseClient;

  Future<ProductCategory> getProductCategory() async {
    String url = "https://raw.githubusercontent.com/enamulhaque028/data/main/prod_category.json";
    final response = await baseClient.client.get(url);
      if (response.statusCode == 200) {
        log('Fetched product category data successful');
        final categoryInfo = productCategoryFromJson(response.data);
        return categoryInfo;
      } else {
        throw Exception("Failed to load product categry");
      }
  }
}
