part of 'product_category_bloc.dart';

@immutable
abstract class ProductCategoryEvent extends Equatable {
  const ProductCategoryEvent();
}

class LoadProductCategoryEvent extends ProductCategoryEvent {
  @override
  List<Object> get props => [];
}