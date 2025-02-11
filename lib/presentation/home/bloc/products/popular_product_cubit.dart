import 'package:flutter_application_1/domain/product/usecase/get_popular_products_usecase.dart';
import 'package:flutter_application_1/presentation/home/bloc/products/popular_product_state.dart';
import 'package:flutter_application_1/servise_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/product/usecase/get_top_seling_products_usecase.dart';

class PopularProductCubit extends Cubit<PopularState> {
  int _page = 1;
  bool _hasReachedMax = false;

  PopularProductCubit() : super(const PopularInitial());

  Future<void> loadPopularProduct() async {
    if (_hasReachedMax) return;

    emit(PopularLoading(
      products: state.products,
      hasReachedMax: state.hasReachedMax,
    ));
    await Future.delayed(const Duration(seconds: 4)); // this must be the server 
    final products = await getIt.call<GetPopularProductsUsecase>().call(params: _page);
    products.fold((error) {
      emit(PopularError(
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
      emit(PopularLoaded(
        products: [...state.products, ...data],
        hasReachedMax: _hasReachedMax,
      ));
    });
  }
}
