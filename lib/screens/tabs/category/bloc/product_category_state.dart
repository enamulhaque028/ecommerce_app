part of 'product_category_bloc.dart';

@immutable
abstract class ProductCategoryState extends Equatable {}

class ProductCategoryLoadingState extends ProductCategoryState {
  @override
  List<Object?> get props => [];
}

class ProductCategoryLoadedState extends ProductCategoryState {
  final ProductCategory productCategory;

  ProductCategoryLoadedState(this.productCategory);

  @override
  List<Object?> get props => [productCategory];
}

class ProductCategoryErrorState extends ProductCategoryState {
  final String error;

  ProductCategoryErrorState(this.error);

  @override
  List<Object?> get props => [error];
}