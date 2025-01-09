import '../repository/products.dart';
import '../../../servise_locator.dart';
import '../../../core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class RemoveProductFromBookmarkUsecase extends UseCase<Either,dynamic>{
  @override
  Future<Either> call({params}) {
    return getIt.call<ProductsRepository>().removeProductFromBookmark(params);
  }

}