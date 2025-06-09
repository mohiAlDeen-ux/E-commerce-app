import '../../../domain/product/usecase/get_cached_rating_information_usecase.dart';
import 'rating_information_state.dart';
import '../../../servise_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/product/usecase/get_product_rating_information_usecase.dart';

class ProductRatingInformationsCubit extends Cubit<RatingInformationState>{
  ProductRatingInformationsCubit():super(const InitialRatingInformationsState());


  Future<void> getRatingInformation(String id,{bool withLoad=true}) async{
    if(withLoad){
      emit(const LoadingRatingInformationsState());
    }  
    final cacheRatingInformationEither =  await getIt.call<GetCachedRatingInformationUsecase>().call(params: id);
    late final bool isLeft;
    final cacheRatingInformation = cacheRatingInformationEither.fold((data){
      isLeft = true;
      return data;
    }, (data){
      isLeft = false;
      return data;
    });
    if(isLeft){  // null or oldest
      if(cacheRatingInformation != null){
        emit(LoadedImmediatelyRatingInformationsState(ratingInformatioinEntity: cacheRatingInformation));
      }
      final apiRatingInformationEither = await getIt.call<GetProductRatingInformationUsecase>().call(params: id);
      apiRatingInformationEither.fold((error){
        cacheRatingInformation != null
        ? emit(FailureRatingInformationsStateWithData(error: error,ratingInformatioinEntity: cacheRatingInformation))
        : emit(FailureRatingInformationsStateWithoutData(error: error));
      }, (data){
      emit(LoadedRatingInformationsState(ratingInformatioinEntity: data));
      });
    }else{
      emit(LoadedRatingInformationsState(ratingInformatioinEntity: cacheRatingInformation));
    }
  }
}