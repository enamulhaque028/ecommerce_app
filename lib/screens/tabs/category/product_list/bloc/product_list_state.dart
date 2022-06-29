part of 'product_list_bloc.dart';

@immutable
abstract class ProductListState extends Equatable {}

class ProductListLoadingState extends ProductListState {
  ProductListLoadingState();
  @override
  List<Object?> get props => [];
}

class ProductListLoadedState extends ProductListState {
  final List<Result> productList;
  final bool enablePullUp;
  ProductListLoadedState({required this.productList, this.enablePullUp = true});

  @override
  List<Object?> get props => [productList];
}

class ProductListErrorState extends ProductListState {
  final String error;
  ProductListErrorState(this.error);

  @override
  List<Object?> get props => [error];
}

class ProductListRefreshCompleteState extends ProductListState {
  @override
  List<Object?> get props => [];
}

class ProductListLoadMoreCompleteState extends ProductListState {
  @override
  List<Object?> get props => [];
}
