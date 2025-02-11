import '../../../core/usecase/usecase.dart';
import '../repository/products.dart';
import '../../../servise_locator.dart';
import 'package:dartz/dartz.dart';

class GetCachedRatingInformationUsecase extends UseCase<Either,String>{
  @override
  Future<Either> call({String? params}) async{
    return await getIt.call<ProductsRepository>().getCacheProductRatingInformation(params!);
  }
}