import 'package:flutter_application_1/domain/product/usecase/get_cached_paying_information_usecase.dart';
import 'package:flutter_application_1/domain/product/usecase/get_product_pying_information_usecase.dart';
import 'package:flutter_application_1/presentation/product/bloc/paying_informatoin_state.dart';
import 'package:flutter_application_1/servise_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPayingInformationsCubit extends Cubit<PayingInformationState>{
  ProductPayingInformationsCubit():super(const InitialPayingInformationsState());


  Future<void> getPayingInformation(String id) async{
    emit(const LoadingPayingInformationsState());
    //await Future.delayed(const Duration(seconds: 3));
    final cachePayingInformationEither =  await getIt.call<GetCachedPayingInformationUsecase>().call(params: id);
    late final bool isLeft;
    final cachePayingInformation = cachePayingInformationEither.fold((data){
      isLeft = true;
      return data;
    }, (data){
      isLeft = false;
      return data;
    });
    if(isLeft){  // null or oldest
      print("null or oldest");
      if(cachePayingInformation != null){
        emit(LoadedImmediatelyPayingInformationsState(payingInformationEntity: cachePayingInformation));
      }
      final apiPayingInformationEither = await getIt.call<GetProductPayingInformationUsecase>().call(params: id);
      apiPayingInformationEither.fold((error){
        cachePayingInformation != null
        ? emit(FailurePayingInformationsStateWithData(error: error,payingInformationEntity: cachePayingInformation))
        : emit(FailurePayingInformationsStateWithoutData(error: error));
      }, (data){
      emit(LoadedPayingInformationsState(payingInformationEntity: data));
      });
    }else{
      emit(LoadedPayingInformationsState(payingInformationEntity: cachePayingInformation));
    }
  }
}