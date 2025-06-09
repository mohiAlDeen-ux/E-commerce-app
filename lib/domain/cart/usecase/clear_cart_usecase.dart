import 'package:flutter_application_1/domain/cart/repository/cart.dart';

import '../../../core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';
import '../../../servise_locator.dart';

class ClearCartUsecase extends UseCase<Either,dynamic> {  
  @override
  Future<Either> call({params}) async{
    return getIt.call<CartRepository>().clearCart();
  }
}
