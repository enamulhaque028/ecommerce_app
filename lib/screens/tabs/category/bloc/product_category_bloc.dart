import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/product_category.dart';
import '../../../../data/repositories/product_category_repository.dart';

part 'product_category_event.dart';
part 'product_category_state.dart';

class ProductCategoryBloc extends Bloc<ProductCategoryEvent, ProductCategoryState> {
  final ProductCategoryRepository _productCategoryRepository;

  ProductCategoryBloc(this._productCategoryRepository) : super(ProductCategoryLoadingState()) {
    on<LoadProductCategoryEvent>((event, emit) async => await _mapLoadProductCategoryEventToState(emit, state));
  }
  
  Future<void> _mapLoadProductCategoryEventToState(Emitter<ProductCategoryState> emit, ProductCategoryState state) async {
      emit(ProductCategoryLoadingState());
      try {
        final news = await _productCategoryRepository.getProductCategory();
        emit(ProductCategoryLoadedState(news));
      } catch (e) {
        emit(ProductCategoryErrorState(e.toString()));
      }
    }
}
