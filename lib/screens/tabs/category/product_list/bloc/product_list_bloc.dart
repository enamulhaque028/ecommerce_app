import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ecommerce_app/data/models/product_list.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/repositories/product_list_repository.dart';

part 'product_list_event.dart';
part 'product_list_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  final ProductListRepository _productListRepository;
  ProductListBloc(this._productListRepository) : super(ProductListLoadingState()) {

    on<LoadProductListEvent>((event, emit) async => await _mapLoadProductListEventToState(emit, state));

    on<RefreshProductListEvent>((event, emit) async => await _mapRefreshProductListEventToState(emit, state));
    
    on<LoadMoreProductListEvent>((event, emit) async => await _mapLoadMoreProductListEventToState(emit));
  }

  Future<void> _mapLoadProductListEventToState(Emitter<ProductListState> emit, ProductListState state) async{
    emit(ProductListLoadingState());
    try {
      final productList = await _productListRepository.getProductList(emit: emit);
      emit(ProductListLoadedState(productList: productList!));
    } catch (e) {
      emit(ProductListLoadedState(productList: const []));
      if (state is ProductListLoadedState) {
        emit(ProductListLoadedState(productList: state.productList, enablePullUp: false));
      }
    }
  }

  Future<void> _mapRefreshProductListEventToState(Emitter<ProductListState> emit, ProductListState state) async {
    try {
      final productList = await _productListRepository.getProductList(isRefresh: true, emit: emit);
      emit(ProductListRefreshCompleteState());
      emit(ProductListLoadedState(productList: productList!));
    } catch (e) {
      emit(ProductListLoadedState(productList: const[]));
      if (state is ProductListLoadedState) {
        emit(ProductListRefreshCompleteState());
        emit(ProductListLoadedState(productList: state.productList, enablePullUp: false));
      }
    }
  }
  
  Future<void> _mapLoadMoreProductListEventToState(Emitter<ProductListState> emit) async {
    try {
      final productList = await _productListRepository.getProductList(emit: emit);
      emit(ProductListLoadMoreCompleteState());
      emit(ProductListLoadedState(productList: productList!));
    } on DioError catch (e) {
      if (e.error is SocketException) {
        emit(ProductListErrorState('Please check your internet connection..',));
      }
    }
  }
}