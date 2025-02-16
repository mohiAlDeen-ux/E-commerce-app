import 'package:flutter_application_1/common/bloc/product_list_with_pagination_and_cache/product_list_state.dart';
import 'package:flutter_application_1/core/usecase/usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ProductsCubit extends Cubit<ProductsListState> {
  int _page = 1;
  bool _isLoading = false;
  final UseCase getCacheProductUsecase;
  final UseCase getServerProductUsecase;

  ProductsCubit({required this.getCacheProductUsecase, required this.getServerProductUsecase}) : super(const ProductsInitial());

  Future<void> loadProducts() async {
    print(state);
    if (state is ProductsError || state.hasReachedMax || _isLoading) {
      return;
    }
    _isLoading = true;
    final oldState = state;
    emit(ProductsLoading(products: state.products, hasReachedMax: state.hasReachedMax));

    await Future.delayed(const Duration(seconds: 2));
    final productsResult = await getServerProductUsecase.call(params: _page);
    final cacheProductsResult = await getCacheProductUsecase.call();

    await productsResult.fold((error) async{
      if (state.products.isEmpty) { // this is first page when open the app
        emit(ProductsLoadedLocaly(products: cacheProductsResult, hasReachedMax: true));
      } else {
        // here this state can happen because i check is there enuph data
        emit(ProductsError(products: state.products, message: error.toString(), hasReachedMax: state.hasReachedMax));
        await Future.delayed(const Duration(seconds: 4));
        emit(oldState);
      }
    }, (data) {
      bool hasReachedMax = data.isEmpty;
      _page = hasReachedMax ? _page : _page + 1;
      emit(ProductsLoaded(products: [...state.products, ...data], hasReachedMax: hasReachedMax));
    });
    _isLoading = false;
  }

  Future<void> refresh() async{
    final oldStat = state;
    emit(ProductsLoading(products: state.products, hasReachedMax: state.hasReachedMax));
    await Future.delayed(const Duration(seconds: 2));
    final productsResult = await getServerProductUsecase.call(params: 1);
    productsResult.fold((error) async{
                
      emit(ProductsError(products: state.products, message: error.toString(), hasReachedMax: state.hasReachedMax));
      await Future.delayed(const Duration(seconds: 2));
      emit(oldStat);
    }, (data) {
      _page = 2;
      bool hasReachedMax = data.isEmpty;
      emit(ProductsLoaded(products: data, hasReachedMax: hasReachedMax));
    });
    return;
  }
}
