part of 'product_bloc.dart';

abstract class ProductState {}

class InitialProductState extends ProductState {}

class LoadingProductState extends ProductState {}

class LoadedProductState extends ProductState {
  final List<Item> items;

  LoadedProductState({@required this.items});
}

class FailedProductState extends ProductState {
  final Exception exception;

  FailedProductState({@required this.exception});
}
