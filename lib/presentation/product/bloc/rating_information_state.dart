import 'package:flutter_application_1/domain/product/entity/rating_informatioin_entity.dart';

abstract class RatingInformationState{
  final RatingInformatioinEntity? ratingInformatioinEntity;

  const RatingInformationState({required this.ratingInformatioinEntity});
}

class InitialRatingInformationsState extends RatingInformationState{
  const InitialRatingInformationsState():super(ratingInformatioinEntity: null);
}

class LoadingRatingInformationsState extends RatingInformationState{
  const LoadingRatingInformationsState():super(ratingInformatioinEntity: null);
}

class LoadedRatingInformationsState extends RatingInformationState{
  const LoadedRatingInformationsState({required super.ratingInformatioinEntity});
}

class LoadedImmediatelyRatingInformationsState extends RatingInformationState{
  const LoadedImmediatelyRatingInformationsState({required super.ratingInformatioinEntity});
}

class FailureRatingInformationsStateWithData extends RatingInformationState{
  final String error;
  const FailureRatingInformationsStateWithData({required this.error,required super.ratingInformatioinEntity});
}

class FailureRatingInformationsStateWithoutData extends RatingInformationState{
  final String error;
  const FailureRatingInformationsStateWithoutData({required this.error}):super(ratingInformatioinEntity: null);
}