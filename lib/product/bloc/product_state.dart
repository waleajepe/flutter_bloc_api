part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();
  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductLoadedState extends ProductState {
  const ProductLoadedState({required this.products});
  final List<Product> products;
  @override
  List<Object> get props => [products];
}

class ProductEmptyState extends ProductState {}

class ProductLoadingFailedState extends ProductState {
  const ProductLoadingFailedState({required this.errorMessage});
  final String errorMessage;
}
