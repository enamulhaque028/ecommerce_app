part of 'product_list_bloc.dart';

@immutable
abstract class ProductListEvent extends Equatable {
  const ProductListEvent();
}

class LoadProductListEvent extends ProductListEvent {
  @override
  List<Object?> get props => [];
}

class RefreshProductListEvent extends ProductListEvent {
  @override
  List<Object?> get props => [];
}

class LoadMoreProductListEvent extends ProductListEvent {
  @override
  List<Object?> get props => [];
}
