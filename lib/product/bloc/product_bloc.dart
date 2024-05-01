import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import '../data/repository/product_repository.dart';
import '../../helper/helpers.dart';
import '../data/model/models.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;
  ProductBloc({required this.productRepository}) : super(ProductInitial()) {
    on<GetProductEvent>(
        (GetProductEvent event, Emitter<ProductState> emit) async {
      emit(ProductLoadingState());
      try {
        final products = await productRepository.getProducts();
        if (products.isEmpty) {
          emit(ProductEmptyState());
        } else {
          emit(ProductLoadedState(products: products));
        }
      } catch (e) {
        final message = handleExceptionWithMessage(e);
        emit(ProductLoadingFailedState(errorMessage: message));
      }
    });
  }
}
