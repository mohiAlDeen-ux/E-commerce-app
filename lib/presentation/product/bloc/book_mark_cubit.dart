import '../../../domain/product/entity/product_entity.dart';
import '../../../domain/product/usecase/add_product_to_bookmark_usecase.dart';
import '../../../domain/product/usecase/remove_product_from_bookmark_usecase.dart';
import 'book_mark_state.dart';
import '../../../servise_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';

class BookMarkCubit extends Cubit<BookMarkState>{
  ProductEntity productEntity;
  BookMarkCubit(this.productEntity):super(BookmarkSuccessState(productEntity));


  Future<void> toggleBookmark()async{
    emit(BookmarkLoadingState());
    Either response;

    if(productEntity.bookmark == true){
      response = await getIt.call<RemoveProductFromBookmarkUsecase>().call(params:productEntity.id);

    }else{
      response = await getIt.call<AddProductToBookmarkUsecase>().call(params:productEntity.id);
    }

    await response.fold((error) async{
        emit(BookmarkFaillState(error.toString(), productEntity));
        await Future.delayed(const Duration(seconds: 2));
        emit(BookmarkSuccessState(productEntity));
      }, (data){
        if(data == true){
          productEntity = productEntity.copyWith(bookmark: !productEntity.bookmark);
          emit(BookmarkSuccessState(productEntity));
        }
      });
  }
}