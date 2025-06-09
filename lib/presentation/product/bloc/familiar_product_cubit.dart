import '../../../common/bloc/product_list_with_pagination_and_cache/product_list_state.dart';
import '../../../data/products/models/get_familiar_product_req.dart';
import '../../../domain/product/usecase/get_cached_familiar_product_usecase.dart';
import '../../../domain/product/usecase/get_familiar_product_usecase.dart';
import '../../../servise_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class FamiliarProductCubit extends Cubit<ProductsListState>{
  FamiliarProductCubit({required this.productId}):super(const ProductsInitial());
  int _page = 1;
  bool _isLoading = false;
  final String productId;


  Future<void> loadProducts() async {
    if (_page == 3){
      emit(ProductsLoading(products: state.products, hasReachedMax: state.hasReachedMax));
    }
   
    if (state is ProductsError || state.hasReachedMax || _isLoading) {
      return;
    }
    _isLoading = true;
    final oldState = state;
    emit(ProductsLoading(products: state.products, hasReachedMax: state.hasReachedMax));
    await Future.delayed(const Duration(seconds: 2));
    final productsResult = await getIt.call<GetFamiliarProductUsecase>().call(params: GetFamiliarProductReq(page: _page, productId: productId));
    final cacheProductsResult = await  getIt.call<GetCachedFamiliarProductUsecase>().call(params: productId);
    await productsResult.fold((error) async{
      if (state.products.isEmpty) {
        emit(ProductsLoadedLocaly(products: cacheProductsResult, hasReachedMax: true));
      } else {
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

  Future<void> refresh(String productId) async{
    final oldStat = state;
    emit(ProductsLoading(products: state.products, hasReachedMax: state.hasReachedMax));
    await Future.delayed(const Duration(seconds: 2));
    final productsResult = await getIt.call<GetFamiliarProductUsecase>().call(params: GetFamiliarProductReq(page: _page, productId: productId));
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
