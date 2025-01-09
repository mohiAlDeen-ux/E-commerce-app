import '../../../core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';
import '../repository/products.dart';
import '../../../servise_locator.dart';

class GetTopSelingProductsUsecase extends UseCase<Either,dynamic>{
  @override
  Future<Either> call({params}) async{
    return getIt.call<ProductsRepository>().getTopSellingProducts();
  }

}