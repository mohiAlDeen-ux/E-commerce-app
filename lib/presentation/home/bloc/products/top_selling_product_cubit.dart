import 'package:flutter_application_1/presentation/home/bloc/products/top_selling_product_state.dart';
import 'package:flutter_application_1/servise_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/product/usecase/get_top_seling_products_usecase.dart';

class TopSellingProductCubit extends Cubit<TopSellingState> {
  int _page = 1;
  bool _hasReachedMax = false;

  TopSellingProductCubit() : super(const TopSellingInitial());

  Future<void> loadTopSellingProduct() async {
    if (_hasReachedMax) return;

    emit(TopSellingLoading(
      products: state.products,
      hasReachedMax: state.hasReachedMax,
    ));
    await Future.delayed(const Duration(seconds: 4)); // this must be the server 
    final products = await getIt.call<GetTopSelingProductsUsecase>().call(params: _page);
    products.fold((error) {
      emit(TopSellingError(
        products: state.products,
        message: error.toString(),
        hasReachedMax: state.hasReachedMax,
      ));
    }, (data) {
      if (data.isEmpty) {
        _hasReachedMax = true;
      } else {
        _page++;
      }
      emit(TopSellingLoaded(
        products: [...state.products, ...data],
        hasReachedMax: _hasReachedMax,
      ));
    });
  }
}
