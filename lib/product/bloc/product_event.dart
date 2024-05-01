part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
  // TODO: implement props
  @override
  List<Object?> get props => [];
}

class GetProductEvent extends ProductEvent {}
