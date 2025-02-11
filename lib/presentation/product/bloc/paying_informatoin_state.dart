import 'package:flutter_application_1/domain/product/entity/paying_information_entity.dart';


abstract class PayingInformationState{
  final PayingInformationEntity? payingInformationEntity;

  const PayingInformationState({required this.payingInformationEntity});
}

class InitialPayingInformationsState extends PayingInformationState{
  const InitialPayingInformationsState():super(payingInformationEntity: null);
}

class LoadingPayingInformationsState extends PayingInformationState{
  const LoadingPayingInformationsState():super(payingInformationEntity: null);
}

class LoadedPayingInformationsState extends PayingInformationState{
  const LoadedPayingInformationsState({required super.payingInformationEntity});
}

class LoadedImmediatelyPayingInformationsState extends PayingInformationState{
  const LoadedImmediatelyPayingInformationsState({required super.payingInformationEntity});
}

class FailurePayingInformationsStateWithData extends PayingInformationState{
  final String error;
  const FailurePayingInformationsStateWithData({required this.error,required super.payingInformationEntity});
}

class FailurePayingInformationsStateWithoutData extends PayingInformationState{
  final String error;
  const FailurePayingInformationsStateWithoutData({required this.error}):super(payingInformationEntity: null);
}