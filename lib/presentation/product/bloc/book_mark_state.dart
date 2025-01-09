import '../../../domain/product/entity/product_entity.dart';

abstract class BookMarkState {
}

class BookmarkLoadingState extends BookMarkState{}

class BookmarkFaillState extends BookMarkState{
  String error;
  ProductEntity productEntity;
  BookmarkFaillState(this.error,this.productEntity);
}

class BookmarkSuccessState extends BookMarkState{
    ProductEntity productEntity;
     BookmarkSuccessState(this.productEntity);
}